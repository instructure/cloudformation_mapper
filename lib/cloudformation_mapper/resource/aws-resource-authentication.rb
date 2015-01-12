require 'cloudformation_mapper/resource'

class CloudformationMapper::Resource::AwsResourceAuthentication < CloudformationMapper::Resource
  register_type 'AWS::CloudFormation::Authentication'

  type 'Template'


  parameter do
    type 'Template'
    name :Properties


    parameter do
      type 'String'
      name :accessKeyId
    end

    parameter do
      type 'List<String>'
      name :buckets
    end

    parameter do
      type 'String'
      name :password
    end

    parameter do
      type 'String'
      name :secretKey
    end

    parameter do
      type 'String Valid values are'
      name :type
    end

    parameter do
      type 'List<String>'
      name :uris
    end

    parameter do
      type 'String'
      name :username
    end

    parameter do
      type 'String'
      name :roleName
    end

  end

  parameter do
    type 'Template'
    name :Outputs


  end

end
