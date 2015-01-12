require 'cloudformation_mapper/resource'

class CloudformationMapper::Resource::AwsResourceDynamodbTable < CloudformationMapper::Resource
  register_type 'AWS::DynamoDB::Table'

  type 'Template'


  parameter do
    type 'Template'
    name :Properties


    parameter do
      type 'DynamoDB Attribute Definition'
      name :AttributeDefinitions
    end

    parameter do
      type 'DynamoDB Global Secondary Index'
      name :GlobalSecondaryIndexes
    end

    parameter do
      type 'DynamoDB Key Schema'
      name :KeySchema
    end

    parameter do
      type 'DynamoDB Local Secondary Index'
      name :LocalSecondaryIndexes
    end

    parameter do
      type 'DynamoDB Provisioned Throughput'
      name :ProvisionedThroughput
    end

    parameter do
      type 'Name Type'
      name :TableName
    end

  end

  parameter do
    type 'Template'
    name :Outputs


  end

end
