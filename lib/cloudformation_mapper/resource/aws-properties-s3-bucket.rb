require 'cloudformation_mapper/resource'

class CloudformationMapper::Resource::AwsPropertiesS3Bucket < CloudformationMapper::Resource
  register_type 'AWS::S3::Bucket'

  type 'Template'


  parameter do
    type 'Template'
    name :Properties


    parameter do
      type 'String'
      name :AccessControl
    end

    parameter do
      type 'String'
      name :BucketName
    end

    parameter do
      type 'Amazon S3 Cors Configuration'
      name :CorsConfiguration
    end

    parameter do
      type 'Amazon S3 Lifecycle Configuration'
      name :LifecycleConfiguration
    end

    parameter do
      type 'Amazon S3 Logging Configuration'
      name :LoggingConfiguration
    end

    parameter do
      type 'Amazon S3 Notification Configuration'
      name :NotificationConfiguration
    end

    parameter do
      type 'AWS CloudFormation Resource Tag'
      name :Tags
    end

    parameter do
      type 'Amazon S3 Versioning Configuration'
      name :VersioningConfiguration
    end

    parameter do
      type 'Website Configuration Type'
      name :WebsiteConfiguration
    end

  end

  parameter do
    type 'Template'
    name :Outputs


  end

end
