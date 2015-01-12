require 'cloudformation_mapper/resource'

class CloudformationMapper::Resource::AwsPropertiesBeanstalkEnvironment < CloudformationMapper::Resource
  register_type 'AWS::ElasticBeanstalk::Environment'

  type 'Template'


  parameter do
    type 'Template'
    name :Properties


    parameter do
      type 'String'
      name :ApplicationName
    end

    parameter do
      type 'String'
      name :CNAMEPrefix
    end

    parameter do
      type 'String'
      name :Description
    end

    parameter do
      type 'String'
      name :EnvironmentName
    end

    parameter do
      type 'List<OptionSetting>'
      name :OptionSettings
    end

    parameter do
      type 'String'
      name :SolutionStackName
    end

    parameter do
      type 'String'
      name :TemplateName
    end

    parameter do
      type 'AWS Elastic Beanstalk Environment Tier Property Type'
      name :Tier
    end

    parameter do
      type 'String'
      name :VersionLabel
    end

  end

  parameter do
    type 'Template'
    name :Outputs


  end

end
