require 'cloudformation_mapper/resource'

class CloudformationMapper::Resource::AwsResourceEc2SecurityGroupEgress < CloudformationMapper::Resource
  register_type 'AWS::EC2::SecurityGroupEgress'

  type 'Template'


  parameter do
    type 'Template'
    name :Properties


    parameter do
      type 'String'
      name :CidrIp
    end

    parameter do
      type 'String'
      name :DestinationSecurityGroupId
    end

    parameter do
      type 'Integer'
      name :FromPort
    end

    parameter do
      type 'String'
      name :GroupId
    end

    parameter do
      type 'String'
      name :IpProtocol
    end

    parameter do
      type 'Integer'
      name :ToPort
    end

  end

  parameter do
    type 'Template'
    name :Outputs


  end

end
