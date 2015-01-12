require 'cloudformation_mapper/resource'

class CloudformationMapper::Resource::AwsResourceOpsworksLayer < CloudformationMapper::Resource
  register_type 'AWS::OpsWorks::Layer'

  type 'Template'


  parameter do
    type 'Template'
    name :Properties


    parameter do
      type 'List<Key>'
      name :Attributes
    end

    parameter do
      type 'Boolean'
      name :AutoAssignElasticIps
    end

    parameter do
      type 'Boolean'
      name :AutoAssignPublicIps
    end

    parameter do
      type 'String'
      name :CustomInstanceProfileArn
    end

    parameter do
      type 'AWS OpsWorks Recipes Type'
      name :CustomRecipes
    end

    parameter do
      type 'List<String>'
      name :CustomSecurityGroupIds
    end

    parameter do
      type 'Boolean'
      name :EnableAutoHealing
    end

    parameter do
      type 'Boolean'
      name :InstallUpdatesOnBoot
    end

    parameter do
      type 'String'
      name :Name
    end

    parameter do
      type 'List<String>'
      name :Packages
    end

    parameter do
      type 'String'
      name :Shortname
    end

    parameter do
      type 'String'
      name :StackId
    end

    parameter do
      type 'String'
      name :Type
    end

    parameter do
      type 'AWS OpsWorks VolumeConfiguration Type'
      name :VolumeConfigurations
    end

  end

  parameter do
    type 'Template'
    name :Outputs


  end

end
