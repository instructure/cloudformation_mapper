require 'active_support/concern'

require 'highline'

require 'cloudformation_mapper/parameter'
require 'cloudformation_mapper/parameter/string'

module CloudformationMapper::Parameter::CommaDelimitedListMapper
  extend ActiveSupport::Concern

  module ClassMethods
    def define_dsl_accessors_on klass
      klass.append_value_array name
    end
  end
end

class CloudformationMapper::Parameter::CommaDelimitedList < CloudformationMapper::Parameter::String
  register_type 'CommaDelimitedList'
  register_type 'List<String>'

  def self.mapper
    CloudformationMapper::Parameter::CommaDelimitedListMapper.include super
  end
end
