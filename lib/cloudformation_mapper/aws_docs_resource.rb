require 'open-uri'
require 'nokogiri'

require 'active_support/inflector'

require 'cloudformation_mapper'

class CloudformationMapper::AwsDocsResource < CloudformationMapper::Resource
  class Parameter < CloudformationMapper::Mapper
    class << self
      get_set_value :Required
      def required_with_translate_html val = nil
        required_without_translate_html case val.present? ? val.text : val
        when /Yes/
          true
        when /Conditional/
          # FIXME correctly handle conditionals
          false
        when /No/
          false
        when nil
          nil
        else
          byebug
          'undefined'
        end
      end
      alias_method_chain :required, :translate_html

      def type val = nil
        super case val.present? ? val.text.gsub(/\s+/,' ') : val
        when /A list of Auto Scaling MetricsCollection/
          'List<AutoScalingMetricsCollection>'
        when /List of Auto Scaling Tags/
          'List<AutoScalingTags>'
        when /NotificationConfiguration/
          'NotificationConfiguration'
        when /A list of strings/
          'List<String>'
        when /String/
          'String'
        when /Integer/
          'Integer'
        when nil
          nil
        else
          byebug
          'undefined'
        end
      end

      get_set_value :UpdateRequires
      def update_requires_with_translate_html val = nil
        update_requires_without_translate_html case val.present? ? val.text : val
        when /No interruption/
          'No interruption'
        when /Conditional/
          'Conditional'
        when /Some interruptions/
          'Some interruptions'
        when /Replacement/
          'Replacement'
        when nil
          nil
        else
          byebug
          'undefined'
        end
      end
      alias_method_chain :update_requires, :translate_html
    end
  end

  class << self
    def load resource_url, &block
      klass = if self == CloudformationMapper::AwsDocsResource
                Class.new self
              else
                self
              end

      klass.class_eval do
        if block.arity == 0
          instance_eval &block
        else
          block.call self
        end if block.present?

        puts "Resource #{template_type} from #{resource_url}"

        parameter do |properties|
          properties.type 'Template'
          properties.name :Properties

          open resource_url do |resource_io|
            resource_doc = Nokogiri::HTML resource_io

            resource_doc.xpath("//div[contains(@class, 'variablelist')]/dl/dt").collect do |node|
              description_doc = node.xpath("following-sibling::dd[1]")

              properties.parameter CloudformationMapper::AwsDocsResource::Parameter do |param|
                param.name node.xpath("./span[contains(@class, 'term')][1]").first.content # property_key
                #param.description description_doc.xpath("./p[1]").first.to_s

                puts "\tProperty #{param.name}\n\t\tdescription: '#{param.description}'"

                #:required   :type   :update_requires
                ['Required', 'Type', 'Update requires'].each do |label|
                #['Type'].each do |label|
                  key = label.gsub(/\s+/,'_').downcase
                  param.send key, description_doc.xpath("./p/span[./em[contains(text(), '#{label}')]]/following-sibling::* | ./p/span[./em[contains(text(), '#{label}')]]/following-sibling::text()")
                  puts "\t\t#{key}: '#{param.send key}'"
                end
              end
            end
          end
        end
      end

      return klass
    end
  end
end
