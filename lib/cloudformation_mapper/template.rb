require 'active_support/concern'

require 'cloudformation_mapper'
require 'cloudformation_mapper/dsl_attribute_methods'
require 'cloudformation_mapper/base_mapper'

class CloudformationMapper::Template
  TYPES = Hash.new(self)

  attr_reader :stack_name

  def initialize stack_name
    @stack_name = stack_name
  end

  class << self
    include CloudformationMapper::DslAttributeMethods

    attr_reader :type
    attr_reader :force_type

    class DuplicateTypeError < StandardError; end
    def register_type type, params = {}
      # FIXME: thread safety?
      if CloudformationMapper::Template::TYPES.key? type
        raise DuplicateTypeError, "Duplicate type #{type}"
      end

      CloudformationMapper::Template::TYPES[type] = self

      @type = type
      @force_type = params[:force_type] || type
    end

    get_set_value :Name
    get_set_value :Description

    append_mapping_hash :Parameters, 'CloudformationMapper::Parameter'
    append_mapping_hash :Mappings, 'CloudformationMapper::Mapper'
    append_mapping_hash :Conditions, 'CloudformationMapper::Mapper'
    append_mapping_hash :Resources, 'CloudformationMapper::Mapper'
    append_mapping_hash :Outputs, 'CloudformationMapper::Mapper'

    def as_json *args
      transform = lambda do |memo, (key, mapper)|
        memo.merge({
          key => mapper.attributes
        })
      end

      {
        AWSTemplateFormatVersion: "2010-09-09",
        Description: description,
        Parameters: parameters.inject({}, &transform),
        Mappings: mappings.inject({}, &transform),
        Resources: resources.inject({}, &transform),
        Outputs: outputs.inject({}, &transform)
      }
    end
    alias_method :to_hash, :as_json

    def [] val
      TYPES[val]
    end

    def mapper
      return @mapper if defined? @mapper

      @mapper = Module.new do
        extend ActiveSupport::Concern
        include CloudformationMapper::BaseMapper

        const_set(:ClassMethods, Module.new do
          include CloudformationMapper::DslAttributeMethods
        end)
      end

      @mapper::ClassMethods.module_exec self do |source_template|
        define_method :template do
          source_template
        end
      end

      parameters.each do |key, parameter|
        parameter.define_dsl_accessors_on @mapper::ClassMethods
      end

      outputs.each do |key, output|
        output.define_ref_reader_on @mapper::ClassMethods
      end

      if defined? super
        @mapper.extend super
      end

      return @mapper
    end
  end
end

require 'cloudformation_mapper/parameter'
