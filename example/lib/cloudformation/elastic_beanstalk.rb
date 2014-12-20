require 'cloudformation/vpc'

require 'cloudformation/security_group'
require 'cloudformation/s3_bucket'
require 'cloudformation/user'
require 'cloudformation/sql'
require 'cloudformation/memcache'

class KeyName < CloudformationMapper::Mapper
  type 'String'
  description 'The name of the SSH key to use.'
end

class InstanceType < CloudformationMapper::Mapper
  type 'String'
  description 'The instance type to use for servers.'
  default 'm1.small'
end

class SecretKeyBase < CloudformationMapper::Mapper
  type 'String'
  description 'At least 30 chars, all random, no words. use rake secret to generate'
  no_echo true
  min_length 30
end

class ElasticBeanstalk < CloudformationMapper::Mapper
  type 'AWS::ElasticBeanstalk::Application'
end

class ElasticBeanstalkRole < CloudformationMapper::Mapper
  type 'AWS::IAM::Role'
  properties do
    path '/'
    assume_role_policy_document do
      version '2012-10-17'
      statement([
        item do
          effect 'Allow'
          action ['sts:AssumeRole']
          principal do
            service [ 'ec2.amazonaws.com']
          end
        end
      ])
    end
  end
end

class ElasticBeanstalkInstanceProfile < CloudformationMapper::Mapper
  type 'AWS::IAM::InstanceProfile'
  properties do
    path '/'
    roles [ElasticBeanstalkRole]
  end
end

class ElasticBeanstalkConfig < CloudformationMapper::Mapper
  type 'AWS::ElasticBeanstalk::ConfigurationTemplate'
  properties do
    application_name ElasticBeanstalk
    description 'Default Configuration'
    solution_stack_name '64bit Amazon Linux 2014.03 v1.0.1 running Docker 1.0.0'
    option_settings([
      item do
        namespace 'aws:autoscaling:launchconfiguration'
        option_name 'EC2KeyName'
        value KeyName
      end,
      item do
        namespace 'aws:autoscaling:launchconfiguration'
        option_name 'SecurityGroups'
        value join(', ', SecurityGroup, VpcSecurityGroup)
      end,
      item do
        namespace 'aws:elasticbeanstalk:application:environment'
        option_name 'AWS_ACCESS_KEY_ID'
        value UserAccessKey
      end,
      item do
        namespace 'aws:elasticbeanstalk:application:environment'
        option_name 'AWS_SECRET_KEY'
        value UserAccessKey.secret_access_key
      end,
      item do
        namespace 'aws:elasticbeanstalk:application:environment'
        option_name 'AWS_REGION'
        value ref('AWS::Region')
      end,
      item do
        namespace 'aws:elasticbeanstalk:application:environment'
        option_name 'S3_DOMAIN'
        value get_att('S3Bucket', 'DomainName')
      end,
      item do
        namespace 'aws:elasticbeanstalk:application:environment'
        option_name 'SECRET_KEY_BASE'
        value SecretKeyBase
      end,
      item do
        namespace 'aws:elasticbeanstalk:application:environment'
        option_name 'INS_STACK_NAME'
        value ref('AWS::StackName')
      end,
      item do
        namespace 'aws:elasticbeanstalk:application:environment'
        option_name 'DATABASE_URL'
        value join('',
                   'postgresql://',
                   DBUserName,
                   ':',
                   DBPassword,
                   '@',
                   get_att('SQL', 'Endpoint.Address'),
                   ':',
                   get_att('SQL', 'Endpoint.Port'),
                   '/'
                  )
      end,
      item do
        namespace 'aws:elasticbeanstalk:application:environment'
        option_name 'MEMCACHE_URL'
        value join(':',
                   get_att('Memcache', 'ConfigurationEndpoint.Address'),
                   get_att('Memcache', 'ConfigurationEndpoint.Port')
                  )
      end,
      item do
        namespace 'aws:elasticbeanstalk:application:environment'
        option_name 'LOG_PATH'
        value '/var/log/eb-app'
      end,
      item do
        namespace 'aws:elasticbeanstalk:hostmanager'
        option_name 'LogPublicationControl'
        value 'true'
      end,
#      item do
#        namespace 'aws:elb:loadbalancer'
#        option_name 'LoadBalancerHTTPSPort'
#        value 443
#      end,
#      item do
#        namespace 'aws:elb:loadbalancer'
#        option_name 'SSLCertificateId'
#        value WebSSLCertificateArn
#      end,
      item do
        namespace 'aws:autoscaling:launchconfiguration'
        option_name 'IamInstanceProfile'
        value ElasticBeanstalkInstanceProfile
      end,
      item do
        namespace 'aws:autoscaling:launchconfiguration'
        option_name 'InstanceType'
        value InstanceType
      end,
      item do
        namespace 'aws:ec2:vpc'
        option_name 'VPCId'
        value VpcId
      end,
      item do
        namespace 'aws:ec2:vpc'
        option_name 'Subnets'
        value 'Fn::Join' => [',', VpcSubnets]
      end,
      item do
        namespace 'aws:ec2:vpc'
        option_name 'ELBSubnets'
        value 'Fn::Join' => [',', VpcElbSubnets]
      end,
    ])
  end
end

class ElasticBeanstalkEnvironment < CloudformationMapper::Mapper
  type 'AWS::ElasticBeanstalk::Environment'
  properties do
    application_name ElasticBeanstalk
    template_name ElasticBeanstalkConfig
  end
end
