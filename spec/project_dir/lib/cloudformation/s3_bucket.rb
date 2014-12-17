class S3Bucket < CloudformationMapper::Mapper
  type 'AWS::S3::Bucket'
  properties do
    website_configuration do
      index_document "index.html"
    end
  end
end
