require 'cloudformation_mapper/resource'

class CloudformationMapper::Resource::AwsPropertiesIamAccesskey < CloudformationMapper::Resource
  register_type 'AWS::IAM::AccessKey'

  type 'Template'


  parameter do
    type 'Template'
    name :Properties


    parameter do
      type 'Integer'
      name :Serial
    end

    parameter do
      type 'String'
      name :Status
    end

    parameter do
      type 'String'
      name :UserName
    end

  end

  parameter do
    type 'Template'
    name :Outputs


  end

end
