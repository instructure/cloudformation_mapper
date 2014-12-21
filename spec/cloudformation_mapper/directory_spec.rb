require 'cloudformation_mapper/directory'

RSpec.describe CloudformationMapper::Directory do
  let(:directory){'./example'}

  describe '.load' do
    subject{CloudformationMapper::Directory.load(directory)}

    it 'should load the template described by the given directory' do
      expect(subject.ancestors).to include(CloudformationMapper::TemplateMapper)
    end

    it 'should generate json' do
      json = JSON.pretty_generate(JSON.parse(subject.to_cloudformation))

      expect(json).to eql(<<-JSON.gsub(/^ {8}/, '').chomp)
        {
          "AWSTemplateFormatVersion": "2010-09-09",
          "Description": "Example Cloudformation configuration using Cloudformation Mapper",
          "Parameters": {
            "KeyName": {
              "Type": "String",
              "Description": "The name of the SSH key to use"
            },
            "DBUserName": {
              "Type": "String",
              "Description": "Database user name",
              "Default": "db_user",
              "MinLength": 1
            },
            "DBPassword": {
              "Type": "String",
              "Description": "Database password, at least 8 characters",
              "NoEcho": true,
              "MinLength": 8
            },
            "SecretKeyBase": {
              "Type": "String",
              "Description": "At least 30 chars, all random, no words. use rake secret to generate",
              "NoEcho": true,
              "MinLength": 30
            },
            "InstanceType": {
              "Type": "String",
              "Description": "The instance type to use for servers",
              "Default": "m1.small"
            },
            "VpcId": {
              "Type": "String",
              "Description": "The id of the VPC to launch into"
            },
            "VpcSubnets": {
              "Type": "CommaDelimitedList",
              "Description": "The list of VPC Private subnets to launch resources into"
            },
            "VpcElbSubnets": {
              "Type": "CommaDelimitedList",
              "Description": "The list of VPC Public subnets to launch ELBs into"
            },
            "VpcSecurityGroup": {
              "Type": "String",
              "Description": "VPC wide security group",
              "Default": "default"
            },
            "CacheSubnetGroup": {
              "Type": "String",
              "Description": "ElastiCache Subnet Group to launch Memcache into"
            },
            "DBSubnetGroup": {
              "Type": "String",
              "Description": "RDS Subnet Group to launch PostgreSQL into"
            },
            "WebSSLCertificateArn": {
              "Type": "String",
              "Description": "ARN for the SSL certificate to use with the Web component"
            }
          },
          "Mappings": {
          },
          "Resources": {
            "User": {
              "Type": "AWS::IAM::User"
            },
            "UserAccessKey": {
              "Type": "AWS::IAM::AccessKey",
              "Properties": {
                "Status": "Active",
                "UserName": {
                  "Ref": "User"
                }
              }
            },
            "SecurityGroup": {
              "Type": "AWS::EC2::SecurityGroup",
              "Properties": {
                "GroupDescription": "Security group",
                "VpcId": {
                  "Ref": "VpcId"
                }
              }
            },
            "SecurityGroupIngress": {
              "Type": "AWS::EC2::SecurityGroupIngress",
              "Properties": {
                "GroupId": {
                  "Ref": "SecurityGroup"
                },
                "SourceSecurityGroupId": {
                  "Ref": "SecurityGroup"
                },
                "FromPort": 1,
                "ToPort": 65535,
                "IpProtocol": -1
              }
            },
            "ElasticBeanstalk": {
              "Type": "AWS::ElasticBeanstalk::Application"
            },
            "ElasticBeanstalkRole": {
              "Type": "AWS::IAM::Role",
              "Properties": {
                "Path": "/",
                "AssumeRolePolicyDocument": {
                  "Version": "2012-10-17",
                  "Statement": [
                    {
                      "Effect": "Allow",
                      "Action": [
                        "sts:AssumeRole"
                      ],
                      "Principal": {
                        "Service": [
                          "ec2.amazonaws.com"
                        ]
                      }
                    }
                  ]
                }
              }
            },
            "ElasticBeanstalkInstanceProfile": {
              "Type": "AWS::IAM::InstanceProfile",
              "Properties": {
                "Path": "/",
                "Roles": [
                  {
                    "Ref": "ElasticBeanstalkRole"
                  }
                ]
              }
            },
            "ElasticBeanstalkConfig": {
              "Type": "AWS::ElasticBeanstalk::ConfigurationTemplate",
              "Properties": {
                "ApplicationName": {
                  "Ref": "ElasticBeanstalk"
                },
                "Description": "Default Configuration",
                "SolutionStackName": "64bit Amazon Linux 2014.03 v1.0.1 running Docker 1.0.0",
                "OptionSettings": [
                  {
                    "Namespace": "aws:autoscaling:launchconfiguration",
                    "OptionName": "EC2KeyName",
                    "Value": {
                      "Ref": "KeyName"
                    }
                  },
                  {
                    "Namespace": "aws:autoscaling:launchconfiguration",
                    "OptionName": "SecurityGroups",
                    "Value": {
                      "Fn::Join": [
                        ", ",
                        [
                          {
                            "Ref": "SecurityGroup"
                          },
                          {
                            "Ref": "VpcSecurityGroup"
                          }
                        ]
                      ]
                    }
                  },
                  {
                    "Namespace": "aws:elasticbeanstalk:application:environment",
                    "OptionName": "AWS_ACCESS_KEY_ID",
                    "Value": {
                      "Ref": "UserAccessKey"
                    }
                  },
                  {
                    "Namespace": "aws:elasticbeanstalk:application:environment",
                    "OptionName": "AWS_SECRET_KEY",
                    "Value": {
                      "Fn::GetAtt": [
                        "UserAccessKey",
                        "SecretAccessKey"
                      ]
                    }
                  },
                  {
                    "Namespace": "aws:elasticbeanstalk:application:environment",
                    "OptionName": "AWS_REGION",
                    "Value": {
                      "Ref": "AWS::Region"
                    }
                  },
                  {
                    "Namespace": "aws:elasticbeanstalk:application:environment",
                    "OptionName": "S3_DOMAIN",
                    "Value": {
                      "Fn::GetAtt": [
                        "S3Bucket",
                        "DomainName"
                      ]
                    }
                  },
                  {
                    "Namespace": "aws:elasticbeanstalk:application:environment",
                    "OptionName": "SECRET_KEY_BASE",
                    "Value": {
                      "Ref": "SecretKeyBase"
                    }
                  },
                  {
                    "Namespace": "aws:elasticbeanstalk:application:environment",
                    "OptionName": "INS_STACK_NAME",
                    "Value": {
                      "Ref": "AWS::StackName"
                    }
                  },
                  {
                    "Namespace": "aws:elasticbeanstalk:application:environment",
                    "OptionName": "DATABASE_URL",
                    "Value": {
                      "Fn::Join": [
                        "",
                        [
                          "postgresql://",
                          {
                            "Ref": "DBUserName"
                          },
                          ":",
                          {
                            "Ref": "DBPassword"
                          },
                          "@",
                          {
                            "Fn::GetAtt": [
                              "SQL",
                              "Endpoint.Address"
                            ]
                          },
                          ":",
                          {
                            "Fn::GetAtt": [
                              "SQL",
                              "Endpoint.Port"
                            ]
                          },
                          "/"
                        ]
                      ]
                    }
                  },
                  {
                    "Namespace": "aws:elasticbeanstalk:application:environment",
                    "OptionName": "MEMCACHE_URL",
                    "Value": {
                      "Fn::Join": [
                        ":",
                        [
                          {
                            "Fn::GetAtt": [
                              "Memcache",
                              "ConfigurationEndpoint.Address"
                            ]
                          },
                          {
                            "Fn::GetAtt": [
                              "Memcache",
                              "ConfigurationEndpoint.Port"
                            ]
                          }
                        ]
                      ]
                    }
                  },
                  {
                    "Namespace": "aws:elasticbeanstalk:application:environment",
                    "OptionName": "LOG_PATH",
                    "Value": "/var/log/eb-app"
                  },
                  {
                    "Namespace": "aws:elasticbeanstalk:hostmanager",
                    "OptionName": "LogPublicationControl",
                    "Value": "true"
                  },
                  {
                    "Namespace": "aws:autoscaling:launchconfiguration",
                    "OptionName": "IamInstanceProfile",
                    "Value": {
                      "Ref": "ElasticBeanstalkInstanceProfile"
                    }
                  },
                  {
                    "Namespace": "aws:autoscaling:launchconfiguration",
                    "OptionName": "InstanceType",
                    "Value": {
                      "Ref": "InstanceType"
                    }
                  },
                  {
                    "Namespace": "aws:ec2:vpc",
                    "OptionName": "VPCId",
                    "Value": {
                      "Ref": "VpcId"
                    }
                  },
                  {
                    "Namespace": "aws:ec2:vpc",
                    "OptionName": "Subnets",
                    "Value": {
                      "Fn::Join": [
                        ",",
                        {
                          "Ref": "VpcSubnets"
                        }
                      ]
                    }
                  },
                  {
                    "Namespace": "aws:ec2:vpc",
                    "OptionName": "ELBSubnets",
                    "Value": {
                      "Fn::Join": [
                        ",",
                        {
                          "Ref": "VpcElbSubnets"
                        }
                      ]
                    }
                  }
                ]
              }
            },
            "ElasticBeanstalkEnvironment": {
              "Type": "AWS::ElasticBeanstalk::Environment",
              "Properties": {
                "ApplicationName": {
                  "Ref": "ElasticBeanstalk"
                },
                "TemplateName": {
                  "Ref": "ElasticBeanstalkConfig"
                }
              }
            },
            "Policy": {
              "Type": "AWS::IAM::Policy",
              "Properties": {
                "PolicyName": "elastic_beanstalk_policy",
                "PolicyDocument": {
                  "Version": "2012-10-17",
                  "Statement": [
                    {
                      "Effect": "Allow",
                      "Action": [
                        "s3:*"
                      ],
                      "Resource": [
                        {
                          "Fn::Join": [
                            "",
                            [
                              "arn:aws:s3:::",
                              {
                                "Ref": "S3Bucket"
                              },
                              "/*"
                            ]
                          ]
                        },
                        {
                          "Fn::Join": [
                            "",
                            [
                              "arn:aws:s3:::",
                              {
                                "Ref": "S3Bucket"
                              }
                            ]
                          ]
                        }
                      ]
                    },
                    {
                      "Effect": "Allow",
                      "Action": [
                        "s3:PutObject"
                      ],
                      "Resource": [
                        {
                          "Fn::Join": [
                            "",
                            [
                              "arn:aws:s3:::elasticbeanstalk-",
                              {
                                "Ref": "AWS::Region"
                              },
                              "-",
                              {
                                "Ref": "AWS::AccountId"
                              },
                              "/resources/environments/logs/*"
                            ]
                          ]
                        }
                      ]
                    },
                    {
                      "Effect": "Allow",
                      "Action": [
                        "cloudwatch:PutMetricData"
                      ],
                      "Resource": "*"
                    }
                  ]
                },
                "Roles": [
                  {
                    "Ref": "ElasticBeanstalkRole"
                  }
                ],
                "Users": [
                  {
                    "Ref": "User"
                  }
                ]
              }
            },
            "SQL": {
              "Type": "AWS::RDS::DBInstance",
              "Properties": {
                "AllocatedStorage": 5,
                "DbInstanceClass": "db.m1.small",
                "Engine": "postgres",
                "MasterUsername": {
                  "Ref": "DBUserName"
                },
                "MasterUserPassword": {
                  "Ref": "DBPassword"
                },
                "VPCSecurityGroups": [
                  {
                    "Ref": "SecurityGroup"
                  }
                ],
                "DbSubnetGroupName": {
                  "Ref": "DBSubnetGroup"
                }
              },
              "DeletionPolicy": "Snapshot"
            },
            "Memcache": {
              "Type": "AWS::ElastiCache::CacheCluster",
              "Properties": {
                "Engine": "memcached",
                "CacheNodeType": "cache.t1.micro",
                "NumCacheNodes": 1,
                "VpcSecurityGroupIds": [
                  {
                    "Fn::GetAtt": [
                      "SecurityGroup",
                      "GroupId"
                    ]
                  }
                ],
                "CacheSubnetGroupName": {
                  "Ref": "CacheSubnetGroup"
                }
              }
            },
            "S3Bucket": {
              "Type": "AWS::S3::Bucket",
              "Properties": {
                "WebsiteConfiguration": {
                  "IndexDocument": "index.html"
                }
              }
            }
          },
          "Outputs": {
          }
        }
      JSON
    end
  end
end
