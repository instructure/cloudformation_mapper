require 'cloudformation/vpc'

require 'cloudformation/security_group'

class DBUserName < CloudformationMapper::Mapper
  type 'String'
  description 'Database user name.'
  default 'db_user'
  min_length 1
end

class DBPassword < CloudformationMapper::Mapper
  type 'String'
  description 'Database password, at least 8 characters.'
  no_echo true
  min_length 8
end

class DBSubnetGroup < CloudformationMapper::Mapper
  type 'AWS::RDS::DBSubnetGroup::Name'
  description 'RDS Subnet Group to launch PostgreSQL into'
  vpc_id VpcId
end

class SQL < CloudformationMapper::Mapper
  type 'AWS::RDS::DBInstance'
  properties do
    allocated_storage 5
    db_instance_class 'db.m1.small'
    engine 'postgres'
    master_username DBUserName
    master_user_password DBPassword
    vpc_security_group SecurityGroup
    db_subnet_group_name DBSubnetGroup
  end
  deletion_policy 'Snapshot'
end
