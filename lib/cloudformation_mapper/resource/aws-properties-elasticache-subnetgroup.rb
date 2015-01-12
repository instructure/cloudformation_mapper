require 'cloudformation_mapper/resource'

class CloudformationMapper::Resource::AwsPropertiesElasticacheSubnetgroup < CloudformationMapper::Resource
  register_type 'AWS::ElastiCache::SubnetGroup '

  type 'Template'


  parameter do
    type 'Template'
    name :Properties


    parameter do
      type 'String'
      name :Description
    end

    parameter do
      type 'List<String>'
      name :SubnetIds
    end

  end

  parameter do
    type 'Template'
    name :Outputs


  end

end
