require 'cloudformation_mapper/resource'

class CloudformationMapper::Resource::AwsPropertiesAsLaunchconfig < CloudformationMapper::Resource
  register_type 'AWS::AutoScaling::LaunchConfiguration'

  type 'Template'


  parameter do
    type 'Template'
    name :Properties


    parameter do
      type 'Boolean'
      name :AssociatePublicIpAddress
    end

    parameter do
      type 'List<BlockDeviceMapping>'
      name :BlockDeviceMappings
    end

    parameter do
      type 'Boolean'
      name :EbsOptimized
    end

    parameter do
      type 'String'
      name :IamInstanceProfile
    end

    parameter do
      type 'String'
      name :ImageId
    end

    parameter do
      type 'String'
      name :InstanceId
    end

    parameter do
      type 'Boolean'
      name :InstanceMonitoring
    end

    parameter do
      type 'String'
      name :InstanceType
    end

    parameter do
      type 'String'
      name :KernelId
    end

    parameter do
      type 'String'
      name :KeyName
    end

    parameter do
      type 'String'
      name :RamDiskId
    end

    parameter do
      type 'List<EC2 security group>'
      name :SecurityGroups
    end

    parameter do
      type 'String'
      name :SpotPrice
    end

    parameter do
      type 'String'
      name :UserData
    end

  end

  parameter do
    type 'Template'
    name :Outputs


  end

end
