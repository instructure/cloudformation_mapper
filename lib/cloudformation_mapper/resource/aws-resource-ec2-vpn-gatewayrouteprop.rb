require 'cloudformation_mapper/resource'

class CloudformationMapper::Resource::AwsResourceEc2VpnGatewayrouteprop < CloudformationMapper::Resource
  register_type 'AWS::EC2::VPNGatewayRoutePropagation'

  type 'Template'


  parameter do
    type 'Template'
    name :Properties


    parameter do
      type 'List<Route table ID>'
      name :RouteTableIds
    end

    parameter do
      type 'String'
      name :VpnGatewayId
    end

  end

  parameter do
    type 'Template'
    name :Outputs


  end

end
