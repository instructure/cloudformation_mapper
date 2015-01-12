require 'cloudformation_mapper/resource'

class CloudformationMapper::Resource::AwsResourceEc2NetworkInterface < CloudformationMapper::Resource
  register_type 'AWS::EC2::NetworkInterface'

  type 'Template'


  parameter do
    type 'Template'
    name :Properties


    parameter do
      type 'String'
      name :Description
    end

    parameter do
      type 'List<String>'
      name :GroupSet
    end

    parameter do
      type 'String'
      name :PrivateIpAddress
    end

    parameter do
      type 'List<PrivateIpAddressSpecification>'
      name :PrivateIpAddresses
    end

    parameter do
      type 'Integer'
      name :SecondaryPrivateIpAddressCount
    end

    parameter do
      type 'Boolean'
      name :SourceDestCheck
    end

    parameter do
      type 'String'
      name :SubnetId
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
