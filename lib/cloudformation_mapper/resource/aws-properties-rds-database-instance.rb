require 'cloudformation_mapper/resource'

class CloudformationMapper::Resource::AwsPropertiesRdsDatabaseInstance < CloudformationMapper::Resource
  register_type 'AWS::RDS::DBInstance'

  type 'Template'


  parameter do
    type 'Template'
    name :Properties


    parameter do
      type 'String'
      name :AllocatedStorage
    end

    parameter do
      type 'Boolean'
      name :AllowMajorVersionUpgrade
    end

    parameter do
      type 'Boolean'
      name :AutoMinorVersionUpgrade
    end

    parameter do
      type 'String'
      name :AvailabilityZone
    end

    parameter do
      type 'String'
      name :BackupRetentionPeriod
    end

    parameter do
      type 'String'
      name :DBInstanceClass
    end

    parameter do
      type 'String'
      name :DBInstanceIdentifier
    end

    parameter do
      type 'String'
      name :DBName
    end

    parameter do
      type 'String'
      name :DBParameterGroupName
    end

    parameter do
      type 'List<String>'
      name :DBSecurityGroups
    end

    parameter do
      type 'String'
      name :DBSnapshotIdentifier
    end

    parameter do
      type 'String'
      name :DBSubnetGroupName
    end

    parameter do
      type 'String'
      name :Engine
    end

    parameter do
      type 'String'
      name :EngineVersion
    end

    parameter do
      type 'Number'
      name :Iops
    end

    parameter do
      type 'String'
      name :LicenseModel
    end

    parameter do
      type 'String'
      name :MasterUsername
    end

    parameter do
      type 'String'
      name :MasterUserPassword
    end

    parameter do
      type 'Boolean'
      name :MultiAZ
    end

    parameter do
      type 'String'
      name :OptionGroupName
    end

    parameter do
      type 'String'
      name :Port
    end

    parameter do
      type 'String'
      name :PreferredBackupWindow
    end

    parameter do
      type 'String'
      name :PreferredMaintenanceWindow
    end

    parameter do
      type 'Boolean'
      name :PubliclyAccessible
    end

    parameter do
      type 'String'
      name :SourceDBInstanceIdentifier
    end

    parameter do
      type 'String'
      name :StorageType
    end

    parameter do
      type 'AWS CloudFormation Resource Tag'
      name :Tags
    end

    parameter do
      type 'List<String>'
      name :VPCSecurityGroups
    end

  end

  parameter do
    type 'Template'
    name :Outputs


  end

end
