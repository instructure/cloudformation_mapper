require 'cloudformation_mapper/resource'

class CloudformationMapper::Resource::RdsDbInstance < CloudformationMapper::Resource
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
