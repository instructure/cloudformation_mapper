require 'aws-sdk'

require 'open-uri'
require 'nokogiri'

require 'active_support/inflector'

DOC_ROOT = 'http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-template-resource-type-ref.html'

namespace :aws_docs do
  desc 'Scrape AWS Docs to generate CloudformationMapper Resource definitions'
  task :scrape do
    open DOC_ROOT do |doc_io|
      doc = Nokogiri::HTML doc_io

      doc.xpath("//div[contains(@class, 'highlights')]/ul/li/a").collect do |node|
        resource_type = node.content
        resource_href = node.attribute('href').content
        resource_url = URI.join(DOC_ROOT, resource_href).to_s
        resource_file = File.join('.', 'lib', 'cloudformation_mapper', 'resource', resource_href.gsub(/.html/, '.rb'))

        puts "Resource #{resource_type} to file #{resource_file} from #{resource_url}"

        open resource_url do |resource_io|
          resource_doc = Nokogiri::HTML resource_io

          resource_doc.xpath("//div[contains(@class, 'variablelist')]/dl/dt").collect do |node|
            property_key = node.xpath("./span[contains(@class, 'term')][1]").first.content

            description_doc = node.xpath("following-sibling::dd[1]")
            property_description = description_doc.xpath("./p[1]").first.content
            property_attributes = ['Required', 'Type', 'Update requires'].inject({}) do |memo, label|
              memo.merge label.underscore.to_sym => description_doc.xpath("./p/span[./em[contains(text(), '#{label}')]]/following-sibling::* | ./p/span[./em[contains(text(), '#{label}')]]/following-sibling::text()")
            end

            puts "\tProperty #{property_key}\n\t\tdescription: '#{property_description.to_s}'"

            property_attributes.each do |key, val|
              puts "\t\t#{key}: '#{val}'"
            end
          end
        end

        break
      end
    end
  end
end
