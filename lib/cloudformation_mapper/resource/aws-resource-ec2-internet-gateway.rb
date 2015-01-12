require 'cloudformation_mapper/resource'

class CloudformationMapper::Resource::AwsResourceEc2InternetGateway < CloudformationMapper::Resource
  register_type 'AWS::EC2::InternetGateway'

  type 'Template'


  parameter do
    type 'Template'
    name :Properties


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
