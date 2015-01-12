require 'cloudformation_mapper/resource'

class CloudformationMapper::Resource::AwsResourceBeanstalkConfigurationtemplate < CloudformationMapper::Resource
  register_type 'AWS::ElasticBeanstalk::ConfigurationTemplate'

  type 'Template'


  parameter do
    type 'Template'
    name :Properties


  end

  parameter do
    type 'Template'
    name :Outputs


  end

end
