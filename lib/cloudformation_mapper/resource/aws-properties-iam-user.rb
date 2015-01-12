require 'cloudformation_mapper/resource'

class CloudformationMapper::Resource::AwsPropertiesIamUser < CloudformationMapper::Resource
  register_type 'AWS::IAM::User'

  type 'Template'


  parameter do
    type 'Template'
    name :Properties


    parameter do
      type 'String'
      name :Path
    end

    parameter do
      type 'List<String>'
      name :Groups
    end

    parameter do
      type 'LoginProfile type'
      name :LoginProfile
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
