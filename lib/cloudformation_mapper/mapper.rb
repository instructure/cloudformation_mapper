require 'active_support/inflector'

require 'cloudformation_mapper'

class CloudformationMapper::Mapper
  TYPES = {}

  def initialize id
    @id = id
  end

  def client
    # return relevent aws-sdk client
  end

  def resource
    # return relevent aws-sdk resource
  end

  class << self
    include CloudformationMapper::DslAttributeMethods

    def name val = nil
      if val.present?
        @name = val
      else
        @name || super()
      end
    end

    attr_reader :template_type
    attr_reader :force_type

    class DuplicateTypeError < StandardError; end
    def register_type type, params = {}
      if CloudformationMapper::Mapper::TYPES.key? type
        warn "Duplicate type #{type}"
      end

      CloudformationMapper::Mapper::TYPES[type] = self

      @template_type = type
      @force_type = params[:force] || type
    end

    def type val = nil
      return attributes[:Type] if val.nil?

      if val.respond_to? :mapper
        template = val
      else
        template = CloudformationMapper::Mapper::TYPES[val]
      end

      if template.present?
        include template.mapper
        attributes[:Type] = template.force_type || val
      else
        attributes[:Type] = val
      end
    end

    def to_ref
      ref self.name
    end

    def as_json *args
      if self.name.present?
        to_ref
      else
        attributes
      end
    end
    alias_method :to_hash, :as_json

    private
    def method_missing meth, *args, &block
      if allow_unknown_attributes?
        key = meth.to_s.camelize.to_sym
        handle_unknown_attribute key, *args, &block
      else
        raise NameError, "Unknown property #{meth} for type #{type}"
      end
    end

    def allow_unknown_attributes?
      true
    end

    def handle_unknown_attribute key, *args, &block
      key = key.to_sym

      if block.present?
        val = item((args.first || default_mapper), &block)
      else
        val = handle_unknown_attribute_args key, *args
      end

      if val.present?
        self[key] = val
      elsif self.has_key? key
        self[key]
      else
        get_att self.name, key
      end
    end

    def handle_unknown_attribute_args key, *args
      args.length == 1 ? args[0] : args
    end
  end
end
