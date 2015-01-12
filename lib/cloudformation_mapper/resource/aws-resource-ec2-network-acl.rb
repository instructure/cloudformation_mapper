require 'cloudformation_mapper/resource'

class CloudformationMapper::Resource::AwsResourceEc2NetworkAcl < CloudformationMapper::Resource
  register_type 'AWS::EC2::NetworkAcl'

  type 'Template'


  parameter do
    type 'Template'
    name :Properties


    parameter do
      type 'AWS CloudFormation Resource Tag'
      name :Tags
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
