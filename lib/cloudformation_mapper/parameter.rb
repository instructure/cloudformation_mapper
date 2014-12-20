require 'active_support/concern'

require 'cloudformation_mapper'
require 'cloudformation_mapper/base_mapper'
require 'cloudformation_mapper/dsl_attribute_methods'

module CloudformationMapper::ParameterMapper
  extend ActiveSupport::Concern

  module ClassMethods
    include CloudformationMapper::DslAttributeMethods

    # http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/parameters-section-structure.html
    get_set_value :Default
    get_set_value :NoEcho
    append_value_array :AllowedValues
    get_set_value :AllowedPattern
    get_set_value :MaxLength
    get_set_value :MinLength
    get_set_value :MaxValue
    get_set_value :MinValue
    get_set_value :Description
    get_set_value :ConstraintDescription

    def allow_unknown_attributes?
      false
    end
  end
end

class CloudformationMapper::Parameter < CloudformationMapper::Mapper
  type CloudformationMapper::Template

  def self.mapper
    CloudformationMapper::ParameterMapper.include super
  end
end
