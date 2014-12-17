class User < CloudformationMapper::Mapper
  type 'AWS::IAM::User'
end

class UserAccessKey < CloudformationMapper::Mapper
  type 'AWS::IAM::AccessKey'
  properties do
    status 'Active'
    user_name User
  end
end
