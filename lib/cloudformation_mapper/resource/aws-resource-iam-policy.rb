require 'cloudformation_mapper/resource'

class CloudformationMapper::Resource::AwsResourceIamPolicy < CloudformationMapper::Resource
  register_type 'AWS::IAM::Policy'

  type 'Template'


  parameter do
    type 'Template'
    name :Properties


    parameter do
      type 'List<String>'
      name :Groups
    end

    parameter do
      type 'JSON object'
      name :PolicyDocument
    end

    parameter do
      type 'String'
      name :PolicyName
    end

    parameter do
      type 'List<String>'
      name :Roles
    end

    parameter do
      type 'List<String>'
      name :Users
    end

  end

  parameter do
    type 'Template'
    name :Outputs


  end

end
