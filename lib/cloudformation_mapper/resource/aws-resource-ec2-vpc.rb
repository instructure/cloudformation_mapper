require 'cloudformation_mapper/resource'

class CloudformationMapper::Resource::AwsResourceEc2Vpc < CloudformationMapper::Resource
  register_type 'AWS::EC2::VPC'

  type 'Template'


  parameter do
    type 'Template'
    name :Properties


    parameter do
      type 'String'
      name :CidrBlock
    end

    parameter do
      type 'Boolean'
      name :EnableDnsSupport
    end

    parameter do
      type 'Boolean'
      name :EnableDnsHostnames
    end

    parameter do
      type 'String'
      name :InstanceTenancy
    end

    parameter do
      type 'AWS CloudFormation Resource Tag'
      name :Tags
    end

  end

  parameter do
    type 'Template'
    name :Outputs


  end

end
