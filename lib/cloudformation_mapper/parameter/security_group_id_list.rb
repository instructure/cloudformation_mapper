require 'active_support/concern'

require 'highline'

require 'cloudformation_mapper/parameter'
require 'cloudformation_mapper/parameter/comma_delimited_list'

module CloudformationMapper::Parameter::SecurityGroupIdListMapper
  extend ActiveSupport::Concern

  module ClassMethods
    def vpc_id val = nil
      val.present? ? @vpc_id = val : @vpc_id
    end

    def prompt sofar
      vpc = sofar[vpc_id.name] || Aws::EC2::Client.new.describe_security_groups
      subnets = vpc.security_groups

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

        def menu.valid_answer? string
          string.split(/\s*,?\s*/).all? do |answer|
            super answer
          end
        end

        def menu.in_range? string
          string.split(/\s*,?\s*/).all? do |answer|
            super answer
          end
        end

        def menu.convert string
          string.split(/\s*,?\s*/).map do |answer|
            super answer
          end.join(', ')
        end

        def menu.select highline_context, string, details = nil
          string.split(/\s*,?\s*/).map do |answer|
            super highline_context, answer, details
          end
        end
      end.map{|o| o.id}.join(', ')
    end
  end
end

class CloudformationMapper::Parameter::SecurityGroupIdList < CloudformationMapper::Parameter::CommaDelimitedList
  register_type 'List<AWS::EC2::SecurityGroup::Id>', force: 'CommaDelimitedList'

  def self.mapper
    CloudformationMapper::Parameter::SecurityGroupIdListMapper.include super
  end
end
