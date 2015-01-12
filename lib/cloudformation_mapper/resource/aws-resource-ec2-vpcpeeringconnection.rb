require 'cloudformation_mapper/resource'

class CloudformationMapper::Resource::AwsResourceEc2Vpcpeeringconnection < CloudformationMapper::Resource
  register_type 'AWS::EC2::VPCPeeringConnection'

  type 'Template'


  parameter do
    type 'Template'
    name :Properties


    parameter do
      type 'String'
      name :PeerVpcId
    end

    parameter do
      type 'AWS CloudFormation Resource Tag'
      name :Tags
    end

    parameter do
      type 'String'
      name :VpcId
    end

  end

  parameter do
    type 'Template'
    name :Outputs


  end

end
