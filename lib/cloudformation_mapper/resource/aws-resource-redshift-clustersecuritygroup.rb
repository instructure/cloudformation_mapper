require 'cloudformation_mapper/resource'

class CloudformationMapper::Resource::AwsResourceRedshiftClustersecuritygroup < CloudformationMapper::Resource
  register_type 'AWS::Redshift::ClusterSecurityGroup'

  type 'Template'


  parameter do
    type 'Template'
    name :Properties


    parameter do
      type 'String'
      name :Description
    end

  end

  parameter do
    type 'Template'
    name :Outputs


  end

end
