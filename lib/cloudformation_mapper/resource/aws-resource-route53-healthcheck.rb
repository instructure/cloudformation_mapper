require 'cloudformation_mapper/resource'

class CloudformationMapper::Resource::AwsResourceRoute53Healthcheck < CloudformationMapper::Resource
  register_type 'AWS::Route53::HealthCheck'

  type 'Template'


  parameter do
    type 'Template'
    name :Properties


    parameter do
      type 'Amazon Route'
      name :HealthCheckConfig
    end

  end

  parameter do
    type 'Template'
    name :Outputs


  end

end
