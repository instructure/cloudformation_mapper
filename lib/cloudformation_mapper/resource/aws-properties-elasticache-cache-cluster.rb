require 'cloudformation_mapper/resource'

class CloudformationMapper::Resource::AwsPropertiesElasticacheCacheCluster < CloudformationMapper::Resource
  register_type 'AWS::ElastiCache::CacheCluster'

  type 'Template'


  parameter do
    type 'Template'
    name :Properties


    parameter do
      type 'Boolean'
      name :AutoMinorVersionUpgrade
    end

    parameter do
      type 'String'
      name :CacheNodeType
    end

    parameter do
      type 'String'
      name :CacheParameterGroupName
    end

    parameter do
      type 'List<String>'
      name :CacheSecurityGroupNames
    end

    parameter do
      type 'String'
      name :CacheSubnetGroupName
    end

    parameter do
      type 'String'
      name :ClusterName
    end

    parameter do
      type 'String'
      name :Engine
    end

    parameter do
      type 'String'
      name :EngineVersion
    end

    parameter do
      type 'String'
      name :NotificationTopicArn
    end

    parameter do
      type 'String'
      name :NumCacheNodes
    end

    parameter do
      type 'Integer'
      name :Port
    end

    parameter do
      type 'String'
      name :PreferredAvailabilityZone
    end

    parameter do
      type 'String'
      name :PreferredMaintenanceWindow
    end

    parameter do
      type 'List<String>'
      name :SnapshotArns
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
