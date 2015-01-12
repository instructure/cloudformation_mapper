require 'cloudformation_mapper/resource'

class CloudformationMapper::Resource::AwsPropertiesWaitcondition < CloudformationMapper::Resource
  register_type 'AWS::CloudFormation::WaitCondition'

  type 'Template'


  parameter do
    type 'Template'
    name :Properties


    parameter do
      type 'String'
      name :Count
    end

    parameter do
      type 'String'
      name :Handle
    end

    parameter do
      type 'String'
      name :Timeout
    end

  end

  parameter do
    type 'Template'
    name :Outputs


  end

end
