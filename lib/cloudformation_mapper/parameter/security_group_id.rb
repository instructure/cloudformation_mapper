require 'active_support/concern'

require 'highline'

require 'cloudformation_mapper/parameter'
require 'cloudformation_mapper/parameter/string'

module CloudformationMapper::Parameter::SecurityGroupIdMapper
  extend ActiveSupport::Concern

  module ClassMethods
    def vpc_id val = nil
      val.present? ? @vpc_id = val : @vpc_id
    end

    def prompt sofar
      vpc = sofar[vpc_id.name] || Aws::EC2::Client.new.describe_security_groups
      security_groups = vpc.security_groups

      HighLine.choose do |menu|
        menu.index        = :letter
        menu.index_suffix = ") "

        menu.header = description

        security_groups.each do |sg|
          name = sg.tags.find(->{Struct.new(:value).new('')}){|t| t.key == "Name"}.value

          menu.choice "#{name} - #{sg.group_name} (#{sg.id})" do
            sg
          end
        end
      end
    end
  end
end

class CloudformationMapper::Parameter::SecurityGroupId < CloudformationMapper::Parameter::String
  register_type 'AWS::EC2::SecurityGroup::Id', force: 'String'

  def self.mapper
    CloudformationMapper::Parameter::SecurityGroupIdMapper.include super
  end
end
