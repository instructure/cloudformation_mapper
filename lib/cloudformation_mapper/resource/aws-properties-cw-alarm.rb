require 'cloudformation_mapper/resource'

class CloudformationMapper::Resource::AwsPropertiesCwAlarm < CloudformationMapper::Resource
  register_type 'AWS::CloudWatch::Alarm'

  type 'Template'


  parameter do
    type 'Template'
    name :Properties


    parameter do
      type 'Boolean'
      name :ActionsEnabled
    end

    parameter do
      type 'List<String>'
      name :AlarmActions
    end

    parameter do
      type 'String'
      name :AlarmDescription
    end

    parameter do
      type 'String'
      name :AlarmName
    end

    parameter do
      type 'String'
      name :ComparisonOperator
    end

    parameter do
      type 'List<Metric Dimension>'
      name :Dimensions
    end

    parameter do
      type 'String'
      name :EvaluationPeriods
    end

    parameter do
      type 'List<String>'
      name :InsufficientDataActions
    end

    parameter do
      type 'String'
      name :MetricName
    end

    parameter do
      type 'String'
      name :Namespace
    end

    parameter do
      type 'List<String>'
      name :OKActions
    end

    parameter do
      type 'String'
      name :Period
    end

    parameter do
      type 'String'
      name :Statistic
    end

    parameter do
      type 'String'
      name :Threshold
    end

    parameter do
      type 'String'
      name :Unit
    end

  end

  parameter do
    type 'Template'
    name :Outputs


  end

end
