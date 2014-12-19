require 'cloudformation/vpc'

require 'cloudformation/security_group'

class CacheSubnetGroup < CloudformationMapper::Mapper
  type 'AWS::ElastiCache::SubnetGroup::Name'
  description 'ElastiCache Subnet Group to launch Memcache into'
  vpc_id VpcId
end

class Memcache < CloudformationMapper::Mapper
  type 'AWS::ElastiCache::CacheCluster'
  properties do
    engine 'memcached'
    cache_node_type 'cache.t1.micro'
    num_cache_nodes 1
    vpc_security_group_ids [SecurityGroup.group_id]
    cache_subnet_group_name CacheSubnetGroup
  end
end
