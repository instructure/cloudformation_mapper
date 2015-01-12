require 'cloudformation_mapper/resource'

class CloudformationMapper::Resource::AwsPropertiesEc2Eip < CloudformationMapper::Resource
  register_type 'AWS::EC2::EIP'

  type 'Template'


  parameter do
    type 'Template'
    name :Properties


    parameter do
      type 'String'
      name :InstanceId
    end

    parameter do
      type 'String'
      name :Domain
    end

  end

  parameter do
    type 'Template'
    name :Outputs


  end

end
