require 'cloudformation_mapper/resource'

class CloudformationMapper::Resource::RdsDbInstance < CloudformationMapper::Resource
  register_type 'AWS::RDS::DBInstance'

  type 'Template'

  parameter do
    type 'Template'
    name :Properties

    parameter do
      type 'List<AWS::EC2::SecurityGroup::Id>'
      name :VPCSecurityGroups
    end
  end
end
