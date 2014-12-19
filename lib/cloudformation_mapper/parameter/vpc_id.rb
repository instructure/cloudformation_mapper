require 'active_support/concern'

require 'highline'

require 'cloudformation_mapper/parameter'
require 'cloudformation_mapper/parameter/string'

module CloudformationMapper::Parameter::VpcIdMapper
  extend ActiveSupport::Concern

  module ClassMethods
    def prompt sofar
      vpcs = Aws::EC2::Resource.new.vpcs

      choose do |menu|
        menu.index        = :letter
        menu.index_suffix = ") "

        menu.header = description

        vpcs.each do |vpc|
          name = vpc.tags.find(->{Struct.new(:value).new('')}){|t| t.key == "Name"}.value
          menu.choice "#{name} (#{vpc.id})" do
            vpc
          end
        end
      end
    end
  end
end

class CloudformationMapper::Parameter::VpcId < CloudformationMapper::Parameter::String
  register_type 'AWS::EC2::VPC::Id', force: 'String'

  def self.mapper
    CloudformationMapper::Parameter::VpcIdMapper.include super
  end
end
