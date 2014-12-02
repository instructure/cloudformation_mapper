require 'cloudformation_mapper/dsl_attribute_methods'

class CloudformationMapper::Template
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
    append_mapping_hash :resources
    append_mapping_hash :outputs

    def as_json
      {
        description: description,
        parameters: parameters,
        mappings: mappings,
        resources: resources,
        outputs: outputs
      }
    end
  end
end
