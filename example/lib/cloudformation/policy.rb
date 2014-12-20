require 'cloudformation/s3_bucket'
require 'cloudformation/user'
require 'cloudformation/elastic_beanstalk'

class Policy < CloudformationMapper::Mapper
  type 'AWS::IAM::Policy'
  properties do
    policy_name 'elastic_beanstalk_policy'
    policy_document do
      version '2012-10-17'
      statement([
        item do
          effect 'Allow'
          action ['s3:*']
          resource [
            join('', 'arn:aws:s3:::', S3Bucket, '/*'),
            join('', 'arn:aws:s3:::', S3Bucket),
          ]
        end,
        item do
          effect 'Allow'
          action ['s3:PutObject']
          resource [
            join('', 'arn:aws:s3:::elasticbeanstalk-', ref('AWS::Region'), '-', ref('AWS::AccountId'), '/resources/environments/logs/*')
          ]
        end,
        item do
          effect 'Allow'
          action ['cloudwatch:PutMetricData']
          resource '*'
        end
      ])
    end
    roles [ElasticBeanstalkRole]
    users [User]
  end
end
