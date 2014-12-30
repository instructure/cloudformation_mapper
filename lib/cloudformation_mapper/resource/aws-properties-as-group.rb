require 'cloudformation_mapper/resource'

class CloudformationMapper::Resource::CloudformationMapper::Resource::Aws-properties-as-group < CloudformationMapper::Resource
  register_type 'AWS::AutoScaling::AutoScalingGroup'

  type 'Template'


  parameter do
    type 'Template'
    name :Properties


    parameter do
      type 'CommaDelimitedList'
      name :VPCSecurityGroups
    end

    parameter do
      type 'List<String>'
      name :AvailabilityZones
    end

    parameter do
      type 'String'
      name :Cooldown
    end

    parameter do
      type 'String'
      name :DesiredCapacity
    end

    parameter do
      type 'Integer'
      name :HealthCheckGracePeriod
    end

    parameter do
      type 'String'
      name :HealthCheckType
    end

    parameter do
      type 'String'
      name :InstanceId
    end

    parameter do
      type 'String'
      name :LaunchConfigurationName
    end

    parameter do
      type 'List<String>'
      name :LoadBalancerNames
    end

    parameter do
      type 'String'
      name :MaxSize
    end

    parameter do
      type 'List<AutoScalingMetricsCollection>'
      name :MetricsCollection
    end

    parameter do
      type 'String'
      name :MinSize
    end

    parameter do
      type 'NotificationConfiguration'
      name :NotificationConfiguration
    end

    parameter do
      type 'String'
      name :PlacementGroup
    end

    parameter do
      type 'List<AutoScalingTags>'
      name :Tags
    end

    parameter do
      type 'List<String>'
      name :TerminationPolicies
    end

    parameter do
      type 'List<String>'
      name :VPCZoneIdentifier
    end

  end

  parameter do
    type 'Template'
    name :Outputs


  end

end
