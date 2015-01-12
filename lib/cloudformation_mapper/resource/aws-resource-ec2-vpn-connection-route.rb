require 'cloudformation_mapper/resource'

class CloudformationMapper::Resource::AwsResourceEc2VpnConnectionRoute < CloudformationMapper::Resource
  register_type 'AWS::EC2::VPNConnectionRoute'

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
      name :VpnConnectionId
    end

  end

  parameter do
    type 'Template'
    name :Outputs


  end

end
