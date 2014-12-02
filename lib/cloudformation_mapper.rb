require "cloudformation_mapper/version"

require 'active_support/all'

require 'cloudformation_mapper/cloudformation-ruby-dsl'

class CloudformationMapper
  class << self
    include Enumerable

    delegate :[], :keys, :each, to: :properties

    def properties
      @properties ||= {}
    end

    def to_ref
      ref self.name
    end

    def as_json *args
      if self.name.present?
        to_ref
      else
        @properties
      end
    end

    private
    def method_missing meth, *args, &block
      key = meth.to_s.camelize.to_sym

      if block.present?
        val = item &block
      else
        val = args.length == 1 ? args[0] : args
      end

      if val.present?
        properties[key] = val
      else
        get_att self.name, key
      end
    end

    def item &block
      Class.new(CloudformationMapper).tap do |item|
        item.module_exec &block
      end
    end
  end
end
