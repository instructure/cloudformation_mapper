require 'cloudformation_mapper/resource'

class CloudformationMapper::Resource::AwsResourceRedshiftClustersecuritygroupingress < CloudformationMapper::Resource
  register_type 'AWS::Redshift::ClusterSecurityGroupIngress'

  type 'Template'


  parameter do
    type 'Template'
    name :Properties


    parameter do
      type 'String'
      name :ClusterSecurityGroupName
    end

    parameter do
      type 'String'
      name :CIDRIP
    end

    parameter do
      type 'String'
      name :EC2SecurityGroupName
    end

    parameter do
      type 'String'
      name :EC2SecurityGroupOwnerId
    end

  end

  parameter do
    type 'Template'
    name :Outputs


  end

end
