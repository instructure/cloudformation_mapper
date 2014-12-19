require 'active_support/concern'

require 'highline'

require 'cloudformation_mapper/parameter'

module CloudformationMapper::Parameter::CommaDelimitedListMapper
  extend ActiveSupport::Concern

  module ClassMethods
    def prompt
      @value = ask("#{key}? ") do |q|
        q.default = self.default
      end.to_s
    end

    def define_dsl_accessors_on klass
      klass.append_value_array name
    end
  end
end

class CloudformationMapper::Parameter::CommaDelimitedList < CloudformationMapper::Parameter
  register_type 'CommaDelimitedList'

  def self.mapper
    CloudformationMapper::Parameter::CommaDelimitedListMapper.include super
  end
end
