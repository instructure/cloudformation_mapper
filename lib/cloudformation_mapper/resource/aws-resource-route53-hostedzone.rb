require 'cloudformation_mapper/resource'

class CloudformationMapper::Resource::AwsResourceRoute53Hostedzone < CloudformationMapper::Resource
  register_type 'AWS::Route53::HostedZone'

  type 'Template'


  parameter do
    type 'Template'
    name :Properties


    parameter do
      type 'Amazon Route'
      name :HostedZoneConfig
    end

    parameter do
      type 'String'
      name :Name
    end

  end

  parameter do
    type 'Template'
    name :Outputs


  end

end
