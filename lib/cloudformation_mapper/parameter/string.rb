require 'active_support/concern'

require 'highline'

require 'cloudformation_mapper/parameter'

module CloudformationMapper::Parameter::StringMapper
  extend ActiveSupport::Concern

  module ClassMethods
    def prompt
      @value = ask("#{key}? ") do |q|
        q.default = self.default
      end.to_s
    end

    def define_dsl_accessors_on klass
      klass.get_set_value name
    end
  end
end

class CloudformationMapper::Parameter::String < CloudformationMapper::Parameter
  register_type 'String'

  def self.mapper
    CloudformationMapper::Parameter::StringMapper.include super
  end
end
