require 'cloudformation_mapper/resource'

class CloudformationMapper::Resource::AwsPropertiesIamGroup < CloudformationMapper::Resource
  register_type 'AWS::IAM::Group'

  type 'Template'


  parameter do
    type 'Template'
    name :Properties


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
