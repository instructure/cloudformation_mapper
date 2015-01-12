require 'cloudformation_mapper/resource'

class CloudformationMapper::Resource::AwsResourceEc2RouteTable < CloudformationMapper::Resource
  register_type 'AWS::EC2::RouteTable'

  type 'Template'


  parameter do
    type 'Template'
    name :Properties


    parameter do
      type 'String'
      name :VpcId
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
