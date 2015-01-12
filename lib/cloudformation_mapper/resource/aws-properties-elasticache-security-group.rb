require 'cloudformation_mapper/resource'

class CloudformationMapper::Resource::AwsPropertiesElasticacheSecurityGroup < CloudformationMapper::Resource
  register_type 'AWS::ElastiCache::SecurityGroup'

  type 'Template'


  parameter do
    type 'Template'
    name :Properties


    parameter do
      type 'String'
      name :Description
    end

  end

  parameter do
    type 'Template'
    name :Outputs


  end

end
