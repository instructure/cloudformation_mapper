require 'cloudformation_mapper/resource'

class CloudformationMapper::Resource::AwsResourceIamRole < CloudformationMapper::Resource
  register_type 'AWS::IAM::Role'

  type 'Template'


  parameter do
    type 'Template'
    name :Properties


    parameter do
      type 'A JSON policy document'
      name :AssumeRolePolicyDocument
    end

    parameter do
      type 'String'
      name :Path
    end

    parameter do
      type 'List<IAM Policy>'
      name :Policies
    end

  end

  parameter do
    type 'Template'
    name :Outputs


  end

end
