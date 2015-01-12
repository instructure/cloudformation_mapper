require 'cloudformation_mapper/resource'

class CloudformationMapper::Resource::AwsResourceEc2DhcpOption < CloudformationMapper::Resource
  register_type 'AWS::EC2::DHCPOptions'

  type 'Template'


  parameter do
    type 'Template'
    name :Properties


    parameter do
      type 'String'
      name :DomainName
    end

    parameter do
      type 'List<String>'
      name :DomainNameServers
    end

    parameter do
      type 'List<String>'
      name :NetbiosNameServers
    end

    parameter do
      type 'List<Number>'
      name :NetbiosNodeType
    end

    parameter do
      type 'List<String>'
      name :NtpServers
    end

    parameter do
      type 'AWS CloudFormation Resource Tag'
      name :Tags
    end

  end

  parameter do
    type 'Template'
    name :Outputs


  end

end
