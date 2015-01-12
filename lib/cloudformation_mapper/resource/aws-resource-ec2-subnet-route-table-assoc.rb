require 'cloudformation_mapper/resource'

class CloudformationMapper::Resource::AwsResourceEc2SubnetRouteTableAssoc < CloudformationMapper::Resource
  register_type 'AWS::EC2::SubnetRouteTableAssociation'

  type 'Template'


  parameter do
    type 'Template'
    name :Properties


    parameter do
      type 'String'
      name :RouteTableId
    end

    parameter do
      type 'String'
      name :SubnetId
    end

  end

  parameter do
    type 'Template'
    name :Outputs


  end

end
