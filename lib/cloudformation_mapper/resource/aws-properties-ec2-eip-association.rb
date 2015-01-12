require 'cloudformation_mapper/resource'

class CloudformationMapper::Resource::AwsPropertiesEc2EipAssociation < CloudformationMapper::Resource
  register_type 'AWS::EC2::EIPAssociation'

  type 'Template'


  parameter do
    type 'Template'
    name :Properties


    parameter do
      type 'String'
      name :AllocationId
    end

    parameter do
      type 'String'
      name :EIP
    end

    parameter do
      type 'String'
      name :InstanceId
    end

    parameter do
      type 'String'
      name :NetworkInterfaceId
    end

    parameter do
      type 'String'
      name :PrivateIpAddress
    end

  end

  parameter do
    type 'Template'
    name :Outputs


  end

end
