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
  type 'String'
  description 'RDS Subnet Group to launch Memcache into'

  def self.prompt sofar
    prompt = "Select RDS Subnet Group? "

    subnet_groups = Aws::RDS::Client.new.describe_db_subnet_groups.db_subnet_groups

    choose do |menu|
      menu.index        = :letter
      menu.index_suffix = ") "

      menu.header = prompt

      subnet_groups.each do |sg|
        if sofar['VpcId'].present? && sofar['VpcId'].id != sg.vpc_id
          next
        end

        menu.choice "#{sg.db_subnet_group_name} (#{sg.vpc_id}) - #{sg.db_subnet_group_description}" do
          sg.db_subnet_group_name
        end
      end
    end
  end
end

class SQL < CloudformationMapper::Mapper
  type 'AWS::RDS::DBInstance'
  properties do
    allocated_storage 5
    db_instance_class 'db.m1.small'
    engine 'postgres'
    master_username DBUserName
    master_user_password DBPassword

    def self.vpc_security_groups *args
      handle_unknown_attribute 'VPCSecurityGroups', *args
    end
    vpc_security_groups [SecurityGroup]

    db_subnet_group_name DBSubnetGroup
  end
  deletion_policy 'Snapshot'
end
