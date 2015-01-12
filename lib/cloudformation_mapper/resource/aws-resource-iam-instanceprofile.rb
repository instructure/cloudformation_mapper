require 'cloudformation_mapper/resource'

class CloudformationMapper::Resource::AwsResourceIamInstanceprofile < CloudformationMapper::Resource
  register_type 'AWS::IAM::InstanceProfile'

  type 'Template'


  parameter do
    type 'Template'
    name :Properties


    parameter do
      type 'String'
      name :Path
    end

    parameter do
      type 'List<References to AW>'
      name :Roles
    end

  end

  parameter do
    type 'Template'
    name :Outputs


  end

end
