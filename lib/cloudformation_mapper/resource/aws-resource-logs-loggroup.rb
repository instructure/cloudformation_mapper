require 'cloudformation_mapper/resource'

class CloudformationMapper::Resource::AwsResourceLogsLoggroup < CloudformationMapper::Resource
  register_type 'AWS::Logs::LogGroup'

  type 'Template'


  parameter do
    type 'Template'
    name :Properties


    parameter do
      type 'Integer'
      name :RetentionInDays
    end

  end

  parameter do
    type 'Template'
    name :Outputs


  end

end
