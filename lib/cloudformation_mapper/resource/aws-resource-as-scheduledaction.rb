require 'cloudformation_mapper/resource'

class CloudformationMapper::Resource::AwsResourceAsScheduledaction < CloudformationMapper::Resource
  register_type 'AWS::AutoScaling::ScheduledAction'

  type 'Template'


  parameter do
    type 'Template'
    name :Properties


    parameter do
      type 'String'
      name :AutoScalingGroupName
    end

    parameter do
      type 'Integer'
      name :DesiredCapacity
    end

    parameter do
      type 'Time stamp'
      name :EndTime
    end

    parameter do
      type 'Integer'
      name :MaxSize
    end

    parameter do
      type 'Integer'
      name :MinSize
    end

    parameter do
      type 'String'
      name :Recurrence
    end

    parameter do
      type 'Time stamp'
      name :StartTime
    end

  end

  parameter do
    type 'Template'
    name :Outputs


  end

end
