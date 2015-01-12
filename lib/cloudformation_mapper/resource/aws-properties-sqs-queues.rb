require 'cloudformation_mapper/resource'

class CloudformationMapper::Resource::AwsPropertiesSqsQueue < CloudformationMapper::Resource
  register_type 'AWS::SQS::Queue'

  type 'Template'


  parameter do
    type 'Template'
    name :Properties


    parameter do
      type 'Integer'
      name :DelaySeconds
    end

    parameter do
      type 'Integer'
      name :MaximumMessageSize
    end

    parameter do
      type 'Integer'
      name :MessageRetentionPeriod
    end

    parameter do
      type 'Name Type'
      name :QueueName
    end

    parameter do
      type 'Integer'
      name :ReceiveMessageWaitTimeSeconds
    end

    parameter do
      type 'Amazon SQS RedrivePolicy'
      name :RedrivePolicy
    end

    parameter do
      type 'Integer'
      name :VisibilityTimeout
    end

  end

  parameter do
    type 'Template'
    name :Outputs


  end

end
