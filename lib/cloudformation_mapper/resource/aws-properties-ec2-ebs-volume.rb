require 'cloudformation_mapper/resource'

class CloudformationMapper::Resource::AwsPropertiesEc2EbsVolume < CloudformationMapper::Resource
  register_type 'AWS::EC2::Volume'

  type 'Template'


  parameter do
    type 'Template'
    name :Properties


    parameter do
      type 'String'
      name :AvailabilityZone
    end

    parameter do
      type 'Boolean'
      name :Encrypted
    end

    parameter do
      type 'Number'
      name :Iops
    end

    parameter do
      type 'String'
      name :Size
    end

    parameter do
      type 'String'
      name :SnapshotId
    end

    parameter do
      type 'AWS CloudFormation Resource Tag'
      name :Tags
    end

    parameter do
      type 'String'
      name :VolumeType
    end

  end

  parameter do
    type 'Template'
    name :Outputs


  end

end
