require 'cloudformation_mapper/resource'

class CloudformationMapper::Resource::AwsPropertiesWaitconditionhandle < CloudformationMapper::Resource
  register_type 'AWS::CloudFormation::WaitConditionHandle'

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
