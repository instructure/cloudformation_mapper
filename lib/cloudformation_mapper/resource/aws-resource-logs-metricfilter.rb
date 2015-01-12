require 'cloudformation_mapper/resource'

class CloudformationMapper::Resource::AwsResourceLogsMetricfilter < CloudformationMapper::Resource
  register_type 'AWS::Logs::MetricFilter'

  type 'Template'


  parameter do
    type 'Template'
    name :Properties


    parameter do
      type 'List<String>'
      name :FilterPattern
    end

    parameter do
      type 'String'
      name :LogGroupName
    end

    parameter do
      type 'List<CloudWatch Logs MetricFilter MetricTransformation Property>'
      name :MetricTransformations
    end

  end

  parameter do
    type 'Template'
    name :Outputs


  end

end
