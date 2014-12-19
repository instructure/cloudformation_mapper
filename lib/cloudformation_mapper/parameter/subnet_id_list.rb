require 'active_support/concern'

require 'highline'

require 'cloudformation_mapper/parameter'
require 'cloudformation_mapper/parameter/comma_delimited_list'

module CloudformationMapper::Parameter::SubnetIdListMapper
  extend ActiveSupport::Concern

  module ClassMethods
    def vpc_id val = nil
      val.present? ? @vpc_id = val : @vpc_id
    end

    def prompt sofar
      vpc = sofar[vpc_id.name] || Aws::EC2::Client.new.describe_subnets
      subnets = vpc.subnets

      choose do |menu|
        menu.index        = :letter
        menu.index_suffix = ") "

        menu.header = description

        subnets.sort do |a, b|
          a = a.tags.find(->{Struct.new(:value).new('')}){|t| t.key == "Name"}.value
          b = b.tags.find(->{Struct.new(:value).new('')}){|t| t.key == "Name"}.value

          a <=> b
        end.each do |subnet|
          name = subnet.tags.find(->{Struct.new(:value).new('')}){|t| t.key == "Name"}.value
          menu.choice "#{name} (#{subnet.id})" do
            subnet
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

class CloudformationMapper::Parameter::SubnetIdList < CloudformationMapper::Parameter::CommaDelimitedList
  register_type 'List<AWS::EC2::Subnet::Id>', force: 'CommaDelimitedList'

  def self.mapper
    CloudformationMapper::Parameter::SubnetIdListMapper.include super
  end
end
