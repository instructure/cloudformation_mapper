require 'cloudformation_mapper/resource'

class CloudformationMapper::Resource::AwsPropertiesSnsPolicy < CloudformationMapper::Resource
  register_type 'AWS::SNS::TopicPolicy'

  type 'Template'


  parameter do
    type 'Template'
    name :Properties


    parameter do
      type 'JSON object'
      name :PolicyDocument
    end

    parameter do
      type 'List<Amazon SNS topics ARN>'
      name :Topics
    end

  end

  parameter do
    type 'Template'
    name :Outputs


  end

end
