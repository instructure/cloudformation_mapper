require 'cloudformation_mapper/resource'

class CloudformationMapper::Resource::AwsResourceRedshiftClustersubnetgroup < CloudformationMapper::Resource
  register_type 'AWS::Redshift::ClusterSubnetGroup'

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
      name :SubnetIds
    end

  end

  parameter do
    type 'Template'
    name :Outputs


  end

end
