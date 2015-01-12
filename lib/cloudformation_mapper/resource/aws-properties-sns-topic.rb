require 'cloudformation_mapper/resource'

class CloudformationMapper::Resource::AwsPropertiesSnsTopic < CloudformationMapper::Resource
  register_type 'AWS::SNS::Topic'

  type 'Template'


  parameter do
    type 'Template'
    name :Properties


    parameter do
      type 'String'
      name :DisplayName
    end

    parameter do
      type 'List<SNS Subscription>'
      name :Subscription
    end

    parameter do
      type 'Name Type'
      name :TopicName
    end

  end

  parameter do
    type 'Template'
    name :Outputs


  end

end
