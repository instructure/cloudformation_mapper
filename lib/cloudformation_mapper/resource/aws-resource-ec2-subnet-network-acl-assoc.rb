require 'cloudformation_mapper/resource'

class CloudformationMapper::Resource::AwsResourceEc2SubnetNetworkAclAssoc < CloudformationMapper::Resource
  register_type 'AWS::EC2::SubnetNetworkAclAssociation'

  type 'Template'


  parameter do
    type 'Template'
    name :Properties


    parameter do
      type 'String'
      name :SubnetId
    end

    parameter do
      type 'String'
      name :NetworkAclId
    end

  end

  parameter do
    type 'Template'
    name :Outputs


  end

end
