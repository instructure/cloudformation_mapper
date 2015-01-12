require 'cloudformation_mapper/resource'

class CloudformationMapper::Resource::AwsResourceOpsworksInstance < CloudformationMapper::Resource
  register_type 'AWS::OpsWorks::Instance'

  type 'Template'


  parameter do
    type 'Template'
    name :Properties


    parameter do
      type 'String'
      name :AmiId
    end

    parameter do
      type 'String'
      name :Architecture
    end

    parameter do
      type 'String'
      name :AvailabilityZone
    end

    parameter do
      type 'Boolean'
      name :InstallUpdatesOnBoot
    end

    parameter do
      type 'String'
      name :InstanceType
    end

    parameter do
      type 'List<String>'
      name :LayerIds
    end

    parameter do
      type 'String'
      name :Os
    end

    parameter do
      type 'String'
      name :RootDeviceType
    end

    parameter do
      type 'String'
      name :SshKeyName
    end

    parameter do
      type 'String'
      name :StackId
    end

    parameter do
      type 'String'
      name :SubnetId
    end

  end

  parameter do
    type 'Template'
    name :Outputs


  end

end
