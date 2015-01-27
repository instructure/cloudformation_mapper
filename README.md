# CloudformationMapper

Object Oriented DSL and mapper for Cloudformation

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'cloudformation_mapper', git: 'git@github.com:instucture/cloudformation_mapper.git'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cloudformation_mapper

## Usage

```ruby
  #!/usr/local/env ruby

  $LOAD_PATH << File.join(File.dirname(__FILE__), 'lib')
  Dir[File.join(File.dirname(__FILE__), "lib", "cloudformation", "*.rb")].sort.each{|f| require f}

  type CloudformationMapper::Template

  name 'ExampleCloudformationMapper'
  description 'Example Cloudformation configuration using Cloudformation Mapper'

  # Works
  parameter KeyName
  parameter Vpc

  resource Redis

  resource S3Bucket do
    properties do
      website_configuration do
        index_document "index.html"
      end
    end

    # Or

    property do
      name :WebsiteConfiguration

      index_document 'index.html'
    end
  end

  # TODO
  resource git: 'https://github.com/instructure/instucture_docker_cluster' do
    name :ApiServer

    vpc Vpc

    db git: 'https://github.com/instructure/instucture_sql_cluster' do
      vpc Vpc
    end

    s3_bucket S3Bucket
    redis Redis
  end
```

## Contributing

1. Fork it ( https://github.com/instructure/cloudformation_mapper/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
