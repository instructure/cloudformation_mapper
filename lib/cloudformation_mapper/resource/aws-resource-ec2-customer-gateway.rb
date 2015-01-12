require 'cloudformation_mapper/resource'

class CloudformationMapper::Resource::AwsResourceEc2CustomerGateway < CloudformationMapper::Resource
  register_type 'AWS::EC2::CustomerGateway'

  type 'Template'


  parameter do
    type 'Template'
    name :Properties


    parameter do
      type 'Number BgpAsn is always an integer value'
      name :BgpAsn
    end

    parameter do
      type 'String'
      name :IpAddress
    end

    parameter do
      type 'AWS CloudFormation Resource Tag'
      name :Tags
    end

    parameter do
      type 'String'
      name :Type
    end

  end

  parameter do
    type 'Template'
    name :Outputs


  end

end
