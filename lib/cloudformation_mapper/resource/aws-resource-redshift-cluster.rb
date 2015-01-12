require 'cloudformation_mapper/resource'

class CloudformationMapper::Resource::AwsResourceRedshiftCluster < CloudformationMapper::Resource
  register_type 'AWS::Redshift::Cluster'

  type 'Template'


  parameter do
    type 'Template'
    name :Properties


    parameter do
      type 'Boolean'
      name :AllowVersionUpgrade
    end

    parameter do
      type 'Integer'
      name :AutomatedSnapshotRetentionPeriod
    end

    parameter do
      type 'String'
      name :AvailabilityZone
    end

    parameter do
      type 'String'
      name :ClusterParameterGroupName
    end

    parameter do
      type 'List<String>'
      name :ClusterSecurityGroups
    end

    parameter do
      type 'String'
      name :ClusterSubnetGroupName
    end

    parameter do
      type 'String'
      name :ClusterType
    end

    parameter do
      type 'String'
      name :ClusterVersion
    end

    parameter do
      type 'String'
      name :DBName
    end

    parameter do
      type 'String'
      name :ElasticIp
    end

    parameter do
      type 'Boolean'
      name :Encrypted
    end

    parameter do
      type 'String'
      name :HsmClientCertificateIdentifier
    end

    parameter do
      type 'String'
      name :HsmConfigurationIdentifier
    end

    parameter do
      type 'String'
      name :MasterUsername
    end

    parameter do
      type 'String'
      name :MasterUserPassword
    end

    parameter do
      type 'String'
      name :NodeType
    end

    parameter do
      type 'Integer'
      name :NumberOfNodes
    end

    parameter do
      type 'String'
      name :OwnerAccount
    end

    parameter do
      type 'Integer'
      name :Port
    end

    parameter do
      type 'String'
      name :PreferredMaintenanceWindow
    end

    parameter do
      type 'Boolean'
      name :PubliclyAccessible
    end

    parameter do
      type ''
      name :SnapshotClusterIdentifier
    end

    parameter do
      type 'String'
      name :SnapshotIdentifier
    end

    parameter do
      type 'List<String>'
      name :VpcSecurityGroupIds
    end

  end

  parameter do
    type 'Template'
    name :Outputs


  end

end
