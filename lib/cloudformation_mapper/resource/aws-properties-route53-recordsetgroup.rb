require 'cloudformation_mapper/resource'

class CloudformationMapper::Resource::AwsPropertiesRoute53Recordsetgroup < CloudformationMapper::Resource
  register_type 'AWS::Route53::RecordSetGroup'

  type 'Template'


  parameter do
    type 'Template'
    name :Properties


    parameter do
      type 'String'
      name :HostedZoneId
    end

    parameter do
      type 'String'
      name :HostedZoneName
    end

    parameter do
      type 'List<AW>'
      name :RecordSets
    end

    parameter do
      type 'String'
      name :Comment
    end

  end

  parameter do
    type 'Template'
    name :Outputs


  end

end
