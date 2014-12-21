class VpcId < CloudformationMapper::Mapper
  type 'AWS::EC2::VPC::Id'
  description 'The id of the VPC to launch into'
end

class VpcSubnets < CloudformationMapper::Mapper
  type 'List<AWS::EC2::Subnet::Id>'
  description 'The list of VPC Private subnets to launch resources into'
  vpc_id VpcId
end

class VpcElbSubnets < CloudformationMapper::Mapper
  type 'List<AWS::EC2::Subnet::Id>'
  description 'The list of VPC Public subnets to launch ELBs into'
  vpc_id VpcId
end

class VpcSecurityGroup < CloudformationMapper::Mapper
  type 'AWS::EC2::SecurityGroup::Id'
  description 'VPC wide security group'
  default 'default'
  vpc_id VpcId
end
