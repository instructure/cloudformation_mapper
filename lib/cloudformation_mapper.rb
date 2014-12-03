require 'active_support/all'

require "cloudformation_mapper/version"
require "cloudformation_mapper/template"
require "cloudformation_mapper/mapper"

# CloudFormation Ruby DSL https://github.com/bazaarvoice/cloudformation-ruby-dsl
# This Gem provides some useful functionality for now, but long term should be
# replaced with better code.
require 'cloudformation-ruby-dsl/cfntemplate'
require 'cloudformation-ruby-dsl/table'

module CloudformationMapper; end
