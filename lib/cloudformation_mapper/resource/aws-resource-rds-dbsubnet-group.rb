require 'cloudformation_mapper/resource'

class CloudformationMapper::Resource::AwsResourceRdsDbsubnetGroup < CloudformationMapper::Resource
  register_type 'AWS::RDS::DBSubnetGroup'

  type 'Template'


  parameter do
    type 'Template'
    name :Properties


    parameter do
      type 'String'
      name :DBSubnetGroupDescription
    end

    parameter do
      type 'List<String>'
      name :SubnetIds
    end

    parameter do
      type 'List<Resource tag>'
      name :Tags
    end

  end

  parameter do
    type 'Template'
    name :Outputs


  end

end
