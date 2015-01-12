require 'cloudformation_mapper/resource'

class CloudformationMapper::Resource::AwsPropertiesRdsDbparametergroup < CloudformationMapper::Resource
  register_type 'AWS::RDS::DBParameterGroup'

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
      name :Family
    end

    parameter do
      type 'DBParameter'
      name :Parameters
    end

    parameter do
      type 'List<Resource tag>'
      name :Tags
    end

  end

  parameter do
    type 'Template'
    name :Outputs


  end

end
