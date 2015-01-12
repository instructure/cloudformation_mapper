require 'cloudformation_mapper/resource'

class CloudformationMapper::Resource::AwsPropertiesEc2EbsVolumeattachment < CloudformationMapper::Resource
  register_type 'AWS::EC2::VolumeAttachment'

  type 'Template'


  parameter do
    type 'Template'
    name :Properties


    parameter do
      type 'String'
      name :Device
    end

    parameter do
      type 'String'
      name :InstanceId
    end

    parameter do
      type 'String'
      name :VolumeId
    end

  end

  parameter do
    type 'Template'
    name :Outputs


  end

end
