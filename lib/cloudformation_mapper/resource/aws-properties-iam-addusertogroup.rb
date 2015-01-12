require 'cloudformation_mapper/resource'

class CloudformationMapper::Resource::AwsPropertiesIamAddusertogroup < CloudformationMapper::Resource
  register_type 'AWS::IAM::UserToGroupAddition'

  type 'Template'


  parameter do
    type 'Template'
    name :Properties


    parameter do
      type 'String'
      name :GroupName
    end

    parameter do
      type 'List<User>'
      name :Users
    end

  end

  parameter do
    type 'Template'
    name :Outputs


  end

end
