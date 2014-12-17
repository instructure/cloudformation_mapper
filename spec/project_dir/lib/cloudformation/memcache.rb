require 'cloudformation/vpc'

require 'cloudformation/security_group'

class CacheSubnetGroup < CloudformationMapper::Mapper
  type 'String'
  description 'ElastiCache Subnet Group to launch Memcache into'

  def self.prompt sofar
    prompt = "Select Cache Subnet Group? "

    subnet_groups = Aws::ElastiCache::Client.new.describe_cache_subnet_groups.cache_subnet_groups

    choose do |menu|
      menu.index        = :letter
      menu.index_suffix = ") "

      menu.header = prompt

      subnet_groups.each do |sg|
        if sofar['VpcId'].present? && sofar['VpcId'].id != sg.vpc_id
          next
        end

        menu.choice "#{sg.cache_subnet_group_name} (#{sg.vpc_id}) - #{sg.cache_subnet_group_description}" do
          sg.cache_subnet_group_name
        end
      end
    end
  end
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
