require 'active_support/all'

# CloudFormation Ruby DSL https://github.com/bazaarvoice/cloudformation-ruby-dsl
# This Gem provides some useful functionality for now, but long term should be
# replaced with better code.
require 'cloudformation-ruby-dsl/cfntemplate'
require 'cloudformation-ruby-dsl/table'

module CloudformationMapper
  autoload :VERSION, "cloudformation_mapper/version"
  autoload :Template, "cloudformation_mapper/template"
  autoload :Mapper,  "cloudformation_mapper/mapper"
end
