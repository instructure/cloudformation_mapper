require 'cloudformation_mapper/resource'

class CloudformationMapper::Resource::AwsPropertiesRdsSecurityGroup < CloudformationMapper::Resource
  register_type 'AWS::RDS::DBSecurityGroup'

  type 'Template'


  parameter do
    type 'Template'
    name :Properties


    parameter do
      type 'String'
      name :EC2VpcId
    end

    parameter do
      type 'List<RDS Security Group Rule>'
      name :DBSecurityGroupIngress
    end

    parameter do
      type 'String'
      name :GroupDescription
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
