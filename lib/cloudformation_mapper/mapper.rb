require 'cloudformation_mapper'
require 'cloudformation_mapper/template'

class CloudformationMapper::Mapper
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
    def name val = nil
      if val.present?
        @name = val
      else
        @name || super()
      end
    end

    def type val = :NOT_PASSED
      if val == :NOT_PASSED
        attributes[:Type]
      else
        if (template = CloudformationMapper::Template[val]).present?
          include template.mapper
        end

        attributes[:Type] = val
      end
    end

    delegate :[], :[]=, :has_key?, :each, to: :attributes
    def attributes
      @attributes ||= {}
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
        val = item(*args, &block)
      else
        val = args.length == 1 ? args[0] : args
      end

      if val.present?
        self[key] = val
      elsif self.has_key? key
        self[key]
      else
        get_att self.name, key
      end
    end

    def item *args, &block
      Class.new(CloudformationMapper::Mapper) do
        module_exec(*args, &block)
      end
    end
  end
end
