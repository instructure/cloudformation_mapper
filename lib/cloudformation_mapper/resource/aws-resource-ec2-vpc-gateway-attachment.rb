require 'cloudformation_mapper/resource'

class CloudformationMapper::Resource::AwsResourceEc2VpcGatewayAttachment < CloudformationMapper::Resource
  register_type 'AWS::EC2::VPCGatewayAttachment'

  type 'Template'


  parameter do
    type 'Template'
    name :Properties


    parameter do
      type 'String'
      name :InternetGatewayId
    end

    parameter do
      type 'String'
      name :VpcId
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
