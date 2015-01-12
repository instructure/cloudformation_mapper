require 'cloudformation_mapper/resource'

class CloudformationMapper::Resource::AwsPropertiesS3Policy < CloudformationMapper::Resource
  register_type 'AWS::S3::BucketPolicy'

  type 'Template'


  parameter do
    type 'Template'
    name :Properties


    parameter do
      type 'String'
      name :Bucket
    end

    parameter do
      type 'JSON object'
      name :PolicyDocument
    end

  end

  parameter do
    type 'Template'
    name :Outputs


  end

end
