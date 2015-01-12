require 'cloudformation_mapper/resource'

class CloudformationMapper::Resource::AwsPropertiesSqsPolicy < CloudformationMapper::Resource
  register_type 'AWS::SQS::QueuePolicy'

  type 'Template'


  parameter do
    type 'Template'
    name :Properties


    parameter do
      type 'JSON object'
      name :PolicyDocument
    end

    parameter do
      type 'List<String>'
      name :Queues
    end

  end

  parameter do
    type 'Template'
    name :Outputs


  end

end
