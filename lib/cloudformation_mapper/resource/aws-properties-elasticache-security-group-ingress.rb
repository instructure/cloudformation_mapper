require 'cloudformation_mapper/resource'

class CloudformationMapper::Resource::AwsPropertiesElasticacheSecurityGroupIngress < CloudformationMapper::Resource
  register_type 'AWS::ElastiCache::SecurityGroupIngress'

  type 'Template'


  parameter do
    type 'Template'
    name :Properties


    parameter do
      type 'String'
      name :CacheSecurityGroupName
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
