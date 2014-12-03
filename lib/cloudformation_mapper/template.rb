require 'active_support/concern'

require 'cloudformation_mapper/dsl_attribute_methods'
require 'cloudformation_mapper/base_mapper'

class CloudformationMapper::Template
  TYPES = Hash.new(self)

  attr_reader :stack_name

  def initialize stack_name
    @stack_name = stack_name
  end

  class << self
    extend CloudformationMapper::DslAttributeMethods

    attr_reader :type

    class DuplicateTypeError < StandardError; end
    def register_type type
      # FIXME: thread safety?
      if CloudformationMapper::Template::TYPES.defined? type
        raise DuplicateTypeError, "Duplicate type #{type}"
      end

      CloudformationMapper::Template::TYPES[type] = self

      @type = type
    end

    getter_setter :name
    getter_setter :description

    append_mapping_hash :parameters
    append_mapping_hash :mappings
    append_mapping_hash :conditions
    append_mapping_hash :resources
    append_mapping_hash :outputs

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
      @mapper ||= Module.new do
        extend ActiveSupport::Concern
        extend CloudformationMapper::BaseMapper
      end
    end
  end
end
