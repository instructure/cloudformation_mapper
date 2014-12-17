class SecurityGroup < CloudformationMapper::Mapper
  type 'AWS::EC2::SecurityGroup'

  properties do
    group_description 'Security group'
    vpc_id VpcId
  end
end

class SecurityGroupIngress < CloudformationMapper::Mapper
  type 'AWS::EC2::SecurityGroupIngress'
  properties do
    group_id SecurityGroup
    source_security_group_id SecurityGroup
    from_port 1
    to_port 65535
    ip_protocol -1 # all
  end
end
