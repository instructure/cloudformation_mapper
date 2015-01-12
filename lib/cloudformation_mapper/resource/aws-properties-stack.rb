require 'cloudformation_mapper/resource'

class CloudformationMapper::Resource::AwsPropertiesStack < CloudformationMapper::Resource
  register_type 'AWS::CloudFormation::Stack'

  type 'Template'


  parameter do
    type 'Template'
    name :Properties


    parameter do
      type 'List<String>'
      name :NotificationARNs
    end

    parameter do
      type 'CloudFormation Stack Parameters Property Type'
      name :Parameters
    end

    parameter do
      type 'String'
      name :TemplateURL
    end

    parameter do
      type 'String'
      name :TimeoutInMinutes
    end

  end

  parameter do
    type 'Template'
    name :Outputs


  end

end
