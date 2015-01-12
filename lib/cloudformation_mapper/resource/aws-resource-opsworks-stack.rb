require 'cloudformation_mapper/resource'

class CloudformationMapper::Resource::AwsResourceOpsworksStack < CloudformationMapper::Resource
  register_type 'AWS::OpsWorks::Stack'

  type 'Template'


  parameter do
    type 'Template'
    name :Properties


    parameter do
      type 'List<Key>'
      name :Attributes
    end

    parameter do
      type 'AWS OpsWorks ChefConfiguration Type'
      name :ChefConfiguration
    end

    parameter do
      type 'AWS OpsWorks StackConfigurationManager Type'
      name :ConfigurationManager
    end

    parameter do
      type 'AWS OpsWorks Source Type'
      name :CustomCookbooksSource
    end

    parameter do
      type 'JSON object'
      name :CustomJson
    end

    parameter do
      type 'String'
      name :DefaultAvailabilityZone
    end

    parameter do
      type 'String'
      name :DefaultInstanceProfileArn
    end

    parameter do
      type 'String'
      name :DefaultOs
    end

    parameter do
      type 'String'
      name :DefaultRootDeviceType
    end

    parameter do
      type 'String'
      name :DefaultSshKeyName
    end

    parameter do
      type 'String'
      name :DefaultSubnetId
    end

    parameter do
      type 'String'
      name :HostnameTheme
    end

    parameter do
      type 'String'
      name :Name
    end

    parameter do
      type 'String'
      name :ServiceRoleArn
    end

    parameter do
      type 'Boolean'
      name :UseCustomCookbooks
    end

    parameter do
      type 'Boolean'
      name :UseOpsworksSecurityGroups
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
