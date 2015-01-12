require 'cloudformation_mapper/resource'

class CloudformationMapper::Resource::AwsPropertiesElasticacheParameterGroup < CloudformationMapper::Resource
  register_type 'AWS::ElastiCache::ParameterGroup'

  type 'Template'


  parameter do
    type 'Template'
    name :Properties


    parameter do
      type 'String'
      name :CacheParameterGroupFamily
    end

    parameter do
      type 'String'
      name :Description
    end

    parameter do
      type 'JSON object'
      name :Properties
    end

  end

  parameter do
    type 'Template'
    name :Outputs


  end

end
