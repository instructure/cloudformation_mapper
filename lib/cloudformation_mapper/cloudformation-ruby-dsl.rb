# CloudFormation Ruby DSL https://github.com/bazaarvoice/cloudformation-ruby-dsl
# This Gem provides some useful functionality for now, but long term should be
# replaced with better code.

require 'cloudformation-ruby-dsl/cfntemplate'
require 'cloudformation-ruby-dsl/table'

TemplateDSL.module_exec do
  [:parameter, :mapping, :condition, :resource, :output].each do |meth|
    define_method "#{meth}_with_cloudformation_mapper" do |*args, &block|
      if args.length == 1
         args = args.first.to_parameters
      end

      send "#{meth}_without_cloudformation_mapper", *args, &block
    end
    alias_method_chain meth, :cloudformation_mapper
  end
end
