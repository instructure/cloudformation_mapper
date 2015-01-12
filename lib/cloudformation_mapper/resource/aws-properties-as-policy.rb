require 'cloudformation_mapper/resource'

class CloudformationMapper::Resource::AwsPropertiesAsPolicy < CloudformationMapper::Resource
  register_type 'AWS::AutoScaling::ScalingPolicy'

  type 'Template'


  parameter do
    type 'Template'
    name :Properties


    parameter do
      type 'String'
      name :AdjustmentType
    end

    parameter do
      type 'String'
      name :AutoScalingGroupName
    end

    parameter do
      type 'String'
      name :Cooldown
    end

    parameter do
      type 'String'
      name :ScalingAdjustment
    end

  end

  parameter do
    type 'Template'
    name :Outputs


  end

end
