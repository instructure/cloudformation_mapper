require 'active_support/concern'

require 'highline'

require 'cloudformation_mapper/parameter'
require 'cloudformation_mapper/parameter/string'

module CloudformationMapper::Parameter::DBSubnetGroupNameMapper
  extend ActiveSupport::Concern

  module ClassMethods
    def vpc_id val = nil
      val.present? ? @vpc_id = val : @vpc_id
    end

    def prompt sofar
      subnet_groups = Aws::RDS::Client.new.describe_db_subnet_groups.db_subnet_groups

      HighLine.choose do |menu|
        menu.index        = :letter
        menu.index_suffix = ") "

        menu.header = description

        subnet_groups.each do |sg|
          if vpc_id.present? && sofar[vpc_id.name].present? && sofar[vpc_id.name].id != sg.vpc_id
            next
          end

          menu.choice "#{sg.db_subnet_group_name} (#{sg.vpc_id}) - #{sg.db_subnet_group_description}" do
            sg.db_subnet_group_name
          end
        end
      end
    end
  end
end

class CloudformationMapper::Parameter::DBSubnetGroupName < CloudformationMapper::Parameter::String
  register_type 'AWS::RDS::DBSubnetGroup::Name', force: 'String'

  def self.mapper
    CloudformationMapper::Parameter::DBSubnetGroupNameMapper.include super
  end
end
