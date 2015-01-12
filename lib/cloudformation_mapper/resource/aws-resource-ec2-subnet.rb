require 'cloudformation_mapper/resource'

class CloudformationMapper::Resource::AwsResourceEc2Subnet < CloudformationMapper::Resource
  register_type 'AWS::EC2::Subnet'

  type 'Template'


  parameter do
    type 'Template'
    name :Properties


    parameter do
      type 'String'
      name :AvailabilityZone
    end

    parameter do
      type 'String'
      name :CidrBlock
    end

    parameter do
      type 'AWS CloudFormation Resource Tag'
      name :Tags
    end

    parameter do
      type 'Ref ID'
      name :VpcId
    end

  end

  parameter do
    type 'Template'
    name :Outputs


  end

end
