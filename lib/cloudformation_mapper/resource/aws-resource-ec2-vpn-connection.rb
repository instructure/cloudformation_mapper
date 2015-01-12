require 'cloudformation_mapper/resource'

class CloudformationMapper::Resource::AwsResourceEc2VpnConnection < CloudformationMapper::Resource
  register_type 'AWS::EC2::VPNConnection'

  type 'Template'


  parameter do
    type 'Template'
    name :Properties


    parameter do
      type 'String'
      name :Type
    end

    parameter do
      type 'String'
      name :CustomerGatewayId
    end

    parameter do
      type 'Boolean'
      name :StaticRoutesOnly
    end

    parameter do
      type 'AWS CloudFormation Resource Tag'
      name :Tags
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
