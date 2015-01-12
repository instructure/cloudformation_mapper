require 'cloudformation_mapper/resource'

class CloudformationMapper::Resource::AwsResourceEc2NetworkAclEntry < CloudformationMapper::Resource
  register_type 'AWS::EC2::NetworkAclEntry'

  type 'Template'


  parameter do
    type 'Template'
    name :Properties


    parameter do
      type 'String'
      name :CidrBlock
    end

    parameter do
      type 'Boolean'
      name :Egress
    end

    parameter do
      type 'EC2 ICMP Property Type'
      name :Icmp
    end

    parameter do
      type 'String'
      name :NetworkAclId
    end

    parameter do
      type 'EC2 PortRange Property Type'
      name :PortRange
    end

    parameter do
      type 'Number'
      name :Protocol
    end

    parameter do
      type 'String'
      name :RuleAction
    end

    parameter do
      type 'Number'
      name :RuleNumber
    end

  end

  parameter do
    type 'Template'
    name :Outputs


  end

end
