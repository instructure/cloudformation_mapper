require 'cloudformation_mapper/resource'

class CloudformationMapper::Resource::AwsResourceKinesisStream < CloudformationMapper::Resource
  register_type 'AWS::Kinesis::Stream'

  type 'Template'


  parameter do
    type 'Template'
    name :Properties


    parameter do
      type 'Integer'
      name :ShardCount
    end

  end

  parameter do
    type 'Template'
    name :Outputs


  end

end
