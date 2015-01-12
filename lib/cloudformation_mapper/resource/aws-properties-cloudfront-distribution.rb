require 'cloudformation_mapper/resource'

class CloudformationMapper::Resource::AwsPropertiesCloudfrontDistribution < CloudformationMapper::Resource
  register_type 'AWS::CloudFront::Distribution'

  type 'Template'


  parameter do
    type 'Template'
    name :Properties


    parameter do
      type 'DistributionConfig type'
      name :DistributionConfig
    end

  end

  parameter do
    type 'Template'
    name :Outputs


  end

end
