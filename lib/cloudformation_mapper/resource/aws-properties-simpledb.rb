require 'cloudformation_mapper/resource'

class CloudformationMapper::Resource::AwsPropertiesSimpledb < CloudformationMapper::Resource
  register_type 'AWS::SDB::Domain'

  type 'Template'


  parameter do
    type 'Template'
    name :Properties


  end

  parameter do
    type 'Template'
    name :Outputs


  end

end
