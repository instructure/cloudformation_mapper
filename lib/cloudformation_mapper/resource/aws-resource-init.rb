require 'cloudformation_mapper/resource'

class CloudformationMapper::Resource::AwsResourceInit < CloudformationMapper::Resource
  register_type 'AWS::CloudFormation::Init'

  type 'Template'


  parameter do
    type 'Template'
    name :Properties


  end

  parameter do
    type 'Template'
    name :Outputs


  end

end
