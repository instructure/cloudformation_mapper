require 'cloudformation_mapper/resource'

class CloudformationMapper::Resource::AwsPropertiesEc2SecurityGroup < CloudformationMapper::Resource
  register_type 'AWS::EC2::SecurityGroup'

  type 'Template'


  parameter do
    type 'Template'
    name :Properties


    parameter do
      type 'String'
      name :GroupDescription
    end

    parameter do
      type 'EC2 Security Group Rule'
      name :SecurityGroupEgress
    end

    parameter do
      type 'EC2 Security Group Rule'
      name :SecurityGroupIngress
    end

    parameter do
      type 'AWS CloudFormation Resource Tag'
      name :Tags
    end

    parameter do
      type 'String'
      name :VpcId
    end

  end

  parameter do
    type 'Template'
    name :Outputs


  end

end
