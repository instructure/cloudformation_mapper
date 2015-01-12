require 'aws-sdk'

require 'open-uri'
require 'nokogiri'

require 'active_support/inflector'

require 'cloudformation_mapper/aws_docs_resource'

DOC_ROOT = 'http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-template-resource-type-ref.html'

RESOURCE_DIRECTORY = './lib/cloudformation_mapper/resource'
RESOURCE_NAMESPACE = 'CloudformationMapper::Resource'

namespace :aws_docs do
  desc 'Scrape AWS Docs to generate CloudformationMapper Resource definitions'
  task :scrape do
    open DOC_ROOT do |doc_io|
      doc = Nokogiri::HTML doc_io

      doc.xpath("//div[contains(@class, 'highlights')]/ul/li/a").collect do |node|
        resource_href = node.attribute('href').content
        resource_url = URI.join(DOC_ROOT, resource_href).to_s

        doc_template = CloudformationMapper::AwsDocsResource.load(resource_url) do |template|
          template.name "#{RESOURCE_NAMESPACE}::#{resource_href.gsub(/.html/, '').gsub(/-/, '_').classify}"
          template.register_type node.content
        end

        resource_file = File.join(RESOURCE_DIRECTORY, resource_href.gsub(/.html/, '.rb'))
        puts "> #{resource_file}"

        open resource_file, 'w' do |f|
          f.write(doc_template.to_ruby)
        end
      end
    end
  end
end
