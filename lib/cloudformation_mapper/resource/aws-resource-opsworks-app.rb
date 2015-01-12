require 'cloudformation_mapper/resource'

class CloudformationMapper::Resource::AwsResourceOpsworksApp < CloudformationMapper::Resource
  register_type 'AWS::OpsWorks::App'

  type 'Template'


  parameter do
    type 'Template'
    name :Properties


    parameter do
      type 'AWS OpsWorks Source Type'
      name :AppSource
    end

    parameter do
      type 'List<Key>'
      name :Attributes
    end

    parameter do
      type 'String'
      name :Description
    end

    parameter do
      type 'List<String>'
      name :Domains
    end

    parameter do
      type 'Boolean'
      name :EnableSsl
    end

    parameter do
      type 'String'
      name :Name
    end

    parameter do
      type 'String'
      name :Shortname
    end

    parameter do
      type 'AWS OpsWorks SslConfiguration Type'
      name :SslConfiguration
    end

    parameter do
      type 'String'
      name :StackId
    end

    parameter do
      type 'String'
      name :Type
    end

  end

  parameter do
    type 'Template'
    name :Outputs


  end

end
