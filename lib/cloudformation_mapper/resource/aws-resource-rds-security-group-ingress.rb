require 'cloudformation_mapper/resource'

class CloudformationMapper::Resource::AwsResourceRdsSecurityGroupIngress < CloudformationMapper::Resource
  register_type 'AWS::RDS::DBSecurityGroupIngress'

  type 'Template'


  parameter do
    type 'Template'
    name :Properties


    parameter do
      type 'String'
      name :CIDRIP
    end

    parameter do
      type 'String'
      name :DBSecurityGroupName
    end

    parameter do
      type 'String'
      name :EC2SecurityGroupId
    end

    parameter do
      type 'String'
      name :EC2SecurityGroupName
    end

    parameter do
      type 'String'
      name :EC2SecurityGroupOwnerId
    end

  end

  parameter do
    type 'Template'
    name :Outputs


  end

end
