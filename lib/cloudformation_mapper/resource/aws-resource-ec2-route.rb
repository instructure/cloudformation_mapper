require 'cloudformation_mapper/resource'

class CloudformationMapper::Resource::AwsResourceEc2Route < CloudformationMapper::Resource
  register_type 'AWS::EC2::Route'

  type 'Template'


  parameter do
    type 'Template'
    name :Properties


    parameter do
      type 'String'
      name :DestinationCidrBlock
    end

    parameter do
      type 'String'
      name :GatewayId
    end

    parameter do
      type 'String'
      name :InstanceId
    end

    parameter do
      type 'String'
      name :NetworkInterfaceId
    end

    parameter do
      type 'String'
      name :RouteTableId
    end

    parameter do
      type 'String'
      name :VpcPeeringConnectionId
    end

  end

  parameter do
    type 'Template'
    name :Outputs


  end

end
