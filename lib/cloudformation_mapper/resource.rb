require 'active_support/concern'

require 'cloudformation_mapper'
require 'cloudformation_mapper/dsl_attribute_methods'

RESOURCE_TEMPLATE = './lib/cloudformation_mapper/resource/template.rb.erb'

class CloudformationMapper::Resource < CloudformationMapper::Mapper
  type 'Template'

  parameter do
    type 'Template'
    name :Properties
  end

  parameter do
    type 'Template'
    name :Outputs
  end

  class << self
    def to_ruby
      # FIXME probably not thread safe
      $resource_erb_template ||= ERB.new(open(RESOURCE_TEMPLATE).read)
      $resource_erb_template.filename ||= RESOURCE_TEMPLATE

      $resource_erb_template.result(binding.clone)
    end
  end
end
