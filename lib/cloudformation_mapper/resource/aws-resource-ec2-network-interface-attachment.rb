require 'cloudformation_mapper/resource'

class CloudformationMapper::Resource::AwsResourceEc2NetworkInterfaceAttachment < CloudformationMapper::Resource
  register_type 'AWS::EC2::NetworkInterfaceAttachment'

  type 'Template'


  parameter do
    type 'Template'
    name :Properties


    parameter do
      type 'Boolean'
      name :DeleteOnTermination
    end

    parameter do
      type 'String'
      name :DeviceIndex
    end

    parameter do
      type 'String'
      name :InstanceId
    end

    parameter do
      type 'String'
      name :NetworkInterfaceId
    end

  end

  parameter do
    type 'Template'
    name :Outputs


  end

end
