require 'cloudformation_mapper/resource'

class CloudformationMapper::Resource::AwsPropertiesEc2Elb < CloudformationMapper::Resource
  register_type 'AWS::ElasticLoadBalancing::LoadBalancer'

  type 'Template'


  parameter do
    type 'Template'
    name :Properties


    parameter do
      type 'Elastic Load Balancing AccessLoggingPolicy'
      name :AccessLoggingPolicy
    end

    parameter do
      type 'List<AppCookieStickinessPolicy object>'
      name :AppCookieStickinessPolicy
    end

    parameter do
      type 'List<String>'
      name :AvailabilityZones
    end

    parameter do
      type 'Elastic Load Balancing ConnectionDrainingPolicy'
      name :ConnectionDrainingPolicy
    end

    parameter do
      type 'Elastic Load Balancing ConnectionSetting'
      name :ConnectionSettings
    end

    parameter do
      type 'Boolean'
      name :CrossZone
    end

    parameter do
      type 'ElasticLoadBalancing HealthCheck Type'
      name :HealthCheck
    end

    parameter do
      type 'List<String>'
      name :Instances
    end

    parameter do
      type 'List<LBCookieStickinessPolicy object>'
      name :LBCookieStickinessPolicy
    end

    parameter do
      type 'String'
      name :LoadBalancerName
    end

    parameter do
      type 'List<ElasticLoadBalancing Listener Property Type object>'
      name :Listeners
    end

    parameter do
      type 'List<ElasticLoadBalancing policy object>'
      name :Policies
    end

    parameter do
      type 'String'
      name :Scheme
    end

    parameter do
      type 'List<Security groups assigned to your load balancer within your virtual private cloud>'
      name :SecurityGroups
    end

    parameter do
      type 'List<String>'
      name :Subnets
    end

    parameter do
      type 'AWS CloudFormation Resource Tag'
      name :Tags
    end

  end

  parameter do
    type 'Template'
    name :Outputs


  end

end
