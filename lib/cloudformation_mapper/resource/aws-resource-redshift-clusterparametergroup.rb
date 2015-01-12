require 'cloudformation_mapper/resource'

class CloudformationMapper::Resource::AwsResourceRedshiftClusterparametergroup < CloudformationMapper::Resource
  register_type 'AWS::Redshift::ClusterParameterGroup'

  type 'Template'


  parameter do
    type 'Template'
    name :Properties


    parameter do
      type 'String'
      name :Description
    end

    parameter do
      type 'String'
      name :ParameterGroupFamily
    end

    parameter do
      type 'Amazon Redshift Parameter Type'
      name :Parameters
    end

  end

  parameter do
    type 'Template'
    name :Outputs


  end

end
