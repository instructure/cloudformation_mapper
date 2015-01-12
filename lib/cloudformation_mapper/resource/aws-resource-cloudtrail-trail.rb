require 'cloudformation_mapper/resource'

class CloudformationMapper::Resource::AwsResourceCloudtrailTrail < CloudformationMapper::Resource
  register_type 'AWS::CloudTrail::Trail'

  type 'Template'


  parameter do
    type 'Template'
    name :Properties


    parameter do
      type 'Boolean'
      name :IncludeGlobalServiceEvents
    end

    parameter do
      type 'Boolean'
      name :IsLogging
    end

    parameter do
      type 'String'
      name :S3BucketName
    end

    parameter do
      type 'String'
      name :S3KeyPrefix
    end

    parameter do
      type 'String'
      name :SnsTopicName
    end

  end

  parameter do
    type 'Template'
    name :Outputs


  end

end
