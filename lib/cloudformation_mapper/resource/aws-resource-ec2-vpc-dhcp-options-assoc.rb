require 'cloudformation_mapper/resource'

class CloudformationMapper::Resource::AwsResourceEc2VpcDhcpOptionsAssoc < CloudformationMapper::Resource
  register_type 'AWS::EC2::VPCDHCPOptionsAssociation'

  type 'Template'


  parameter do
    type 'Template'
    name :Properties


    parameter do
      type 'String'
      name :DhcpOptionsId
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
