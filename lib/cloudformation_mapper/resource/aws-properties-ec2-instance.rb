require 'cloudformation_mapper/resource'

class CloudformationMapper::Resource::AwsPropertiesEc2Instance < CloudformationMapper::Resource
  register_type 'AWS::EC2::Instance'

  type 'Template'


  parameter do
    type 'Template'
    name :Properties


    parameter do
      type 'String'
      name :AvailabilityZone
    end

    parameter do
      type 'List<Amazon EC2 Block Device Mapping Property>'
      name :BlockDeviceMappings
    end

    parameter do
      type 'Boolean'
      name :DisableApiTermination
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
      name :InstanceInitiatedShutdownBehavior
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
      type 'Boolean'
      name :Monitoring
    end

    parameter do
      type 'List<NetworkInterface object>'
      name :NetworkInterfaces
    end

    parameter do
      type 'String'
      name :PlacementGroupName
    end

    parameter do
      type 'String'
      name :PrivateIpAddress
    end

    parameter do
      type 'String'
      name :RamdiskId
    end

    parameter do
      type 'List<String>'
      name :SecurityGroupIds
    end

    parameter do
      type 'List<String>'
      name :SecurityGroups
    end

    parameter do
      type 'Boolean'
      name :SourceDestCheck
    end

    parameter do
      type 'String'
      name :SubnetId
    end

    parameter do
      type 'AWS CloudFormation Resource Tag'
      name :Tags
    end

    parameter do
      type 'String'
      name :Tenancy
    end

    parameter do
      type 'String'
      name :UserData
    end

    parameter do
      type 'List<EC2 MountPoint>'
      name :Volumes
    end

  end

  parameter do
    type 'Template'
    name :Outputs


  end

end
