require 'cloudformation_mapper/resource'

class CloudformationMapper::Resource::AwsPropertiesBeanstalkVersion < CloudformationMapper::Resource
  register_type 'AWS::ElasticBeanstalk::ApplicationVersion'

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
