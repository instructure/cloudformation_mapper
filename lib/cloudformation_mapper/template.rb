require 'active_support/concern'

require 'cloudformation_mapper'
require 'cloudformation_mapper/dsl_attribute_methods'
require 'cloudformation_mapper/base_mapper'

module CloudformationMapper::TemplateMapper
  extend ActiveSupport::Concern

  module ClassMethods
    include CloudformationMapper::DslAttributeMethods

    get_set_value :Description

    append_mapping_hash :Parameters
    append_mapping_hash :Mappings
    append_mapping_hash :Conditions
    append_mapping_hash :Resources
    append_mapping_hash :Outputs

    def as_cloudformation
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

    def to_cloudformation
      as_cloudformation.to_json
    end

    def mapper
      mapper = Module.new do
        extend ActiveSupport::Concern
        include CloudformationMapper::BaseMapper

        const_set(:ClassMethods, Module.new do
          include CloudformationMapper::DslAttributeMethods
        end)
      end

      mapper::ClassMethods.module_exec self do |source_template|
        define_method :template do
          source_template
        end
      end

      parameters.each do |key, parameter|
        parameter.define_dsl_accessors_on mapper::ClassMethods
      end

      outputs.each do |key, output|
        output.define_outputs_readers_on mapper::ClassMethods
      end

      if defined? super
        mapper.extend super
      end

      return mapper
    end

    def define_dsl_accessors_on mod
      mod.append_mapping_hash name do |mapper|
        parameters.each do |key, parameter|
          parameter.define_dsl_accessors_on mapper.singleton_class
        end
      end
    end

    def define_outputs_readers_on mod
      mod.append_mapping_hash name do |mapper|
        outputs.each do |key, output|
          output.define_dsl_accessors_on mapper.singletone_class
        end
      end
    end
  end
end

class CloudformationMapper::Template < CloudformationMapper::Mapper
  register_type 'Template'

  attr_reader :stack_name

  def initialize stack_name
    @stack_name = stack_name
  end

  def self.mapper
    CloudformationMapper::TemplateMapper
  end
end
