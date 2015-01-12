require 'cloudformation_mapper/resource'

class CloudformationMapper::Resource::AwsPropertiesBeanstalk < CloudformationMapper::Resource
  register_type 'AWS::ElasticBeanstalk::Application'

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
      name :Description
    end

  end

  parameter do
    type 'Template'
    name :Outputs


  end

end
