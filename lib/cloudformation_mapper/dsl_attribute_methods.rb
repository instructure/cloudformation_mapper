require 'active_support/concern'
require 'active_support/inflector'

require 'cloudformation_mapper'

module CloudformationMapper::DslAttributeMethods
  extend ActiveSupport::Concern

  delegate :[], :[]=, :has_key?, :each, to: :attributes
  def attributes
    @attributes ||= {}
  end

  def item mapper_class = default_mapper, &block
    mapper_class = mapper_class.constantize if mapper_class.respond_to? :constantize

    Class.new(mapper_class) do
      instance_eval &block
    end
  end

  def default_mapper
    CloudformationMapper::Mapper
  end

  module ClassMethods
    private
    module NoVal; end

    # Value attributes
    def get_set_value key, method = key.to_s.underscore.to_sym, default = nil 
      define_method method do |val = NoVal, &block|
        if val == NoVal
          val = block.call if block.present?
        end

        unless val == NoVal
          attributes[key] = val
        end

        if attributes.key? key
          attributes[key]
        else
          attributes[key] = default
        end
      end

      define_method "#{method}=" do |val|
        attributes[key] = val
      end
    end

    def append_value_array key, method = key.to_s.underscore.to_sym, singular = method.to_s.singularize.to_sym
      append_value key, method, singular, [] do |array, val|
        array << val
      end
    end

    def append_value key, method, singular, initial_memo
      get_set_value key, method, initial_memo

      define_method singular do |val = NoVal, &block|
        memo = send(method)

        if block.present?
          val = block.call if block.present?
        end

        yield memo, val unless val == NoVal
      end
    end

    # Mapper attributes
    def get_set_mapper key, mapper_class, method = key.to_s.underscore.to_sym, default = nil
      define_method method do |val = nil, &block|
        if block.present?
          val = item(( val || mapper_class), &block)
        end

        if val.present?
          attributes[key] = val
        end

        if attributes.key? key
          attributes[key]
        else
          attributes[key] = default
        end
      end

      define_method "#{method}=" do |val|
        attributes[key] = val
      end
    end

    def append_mapping_hash key, mapper_class, method = key.to_s.underscore.to_sym, singular = method.to_s.singularize.to_sym
      append_mapping key, method, singular, mapper_class, {} do |hash, val|
        hash[val.name] = val
      end
    end

    def append_mapping_array key, mapper_class, method = key.to_s.underscore.to_sym, singular = method.to_s.singularize.to_sym
      append_mapping key, method, singular, mapper_class, [] do |array, val|
        array << val
      end
    end

    def append_mapping key, method = key.to_s.underscore.to_sym, singular, mapper_class, initial_memo
      get_set_value key, method, initial_memo

      define_method singular do |val = nil, &block|
        memo = send(method)

        # If a block is passed, it is evaluated in the context of a new mapper
        # class. val is the class to inherit from, defaulting to mapper_class
        # if not passed.
        if block.present?
          val = item(( val || mapper_class), &block)
        end

        yield memo, val unless val.present?
      end
    end
  end
end
