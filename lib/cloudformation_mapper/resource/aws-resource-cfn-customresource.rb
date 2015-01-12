require 'cloudformation_mapper/resource'

class CloudformationMapper::Resource::AwsResourceCfnCustomresource < CloudformationMapper::Resource
  register_type 'AWS::CloudFormation::CustomResource'

  type 'Template'


  parameter do
    type 'Template'
    name :Properties


    parameter do
      type 'String'
      name :ServiceToken
    end

  end

  parameter do
    type 'Template'
    name :Outputs


  end

end
