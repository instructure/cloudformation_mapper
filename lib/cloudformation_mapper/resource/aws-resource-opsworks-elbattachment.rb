require 'cloudformation_mapper/resource'

class CloudformationMapper::Resource::AwsResourceOpsworksElbattachment < CloudformationMapper::Resource
  register_type 'AWS::OpsWorks::ElasticLoadBalancerAttachment'

  type 'Template'


  parameter do
    type 'Template'
    name :Properties


    parameter do
      type 'String'
      name :ElasticLoadBalancerName
    end

    parameter do
      type 'String'
      name :LayerId
    end

  end

  parameter do
    type 'Template'
    name :Outputs


  end

end
