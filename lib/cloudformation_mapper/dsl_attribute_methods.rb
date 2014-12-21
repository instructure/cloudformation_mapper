require 'active_support/concern'
require 'active_support/inflector'
require 'active_support/core_ext/object/duplicable'

require 'cloudformation_mapper'

module CloudformationMapper::DslAttributeMethods
  extend ActiveSupport::Concern

  delegate :[], :[]=, :keys, :has_key?, :each, to: :attributes
  def attributes
    @attributes ||= if ancestors[1].respond_to? :attributes
                      ancestors[1].attributes.clone
                    else
                      {}
                    end
  end

  def item mapper_class = default_mapper, &block
    mapper_class = mapper_class.constantize if mapper_class.respond_to? :constantize

    Class.new(mapper_class) do
      instance_eval &block if block.present?
    end
  end

  def default_mapper
    CloudformationMapper::Mapper
  end

  def merge other
    clone.merge! other
  end

  def merge! other
    (self.keys & other.keys).each do |key|
      if self[key].respond_to? :merge
        self[key] = self[key].merge other[key]
      else
        self[key] = other[key].duplicable? ? other[key].clone : other[key]
      end
    end

    (other.keys - self.keys).each do |key|
      self[key] = other[key].duplicable? ? other[key].clone : other[key]
    end

    return self
  end

  module ClassMethods
    def item mapper_class = default_mapper, &block
      mapper_class = mapper_class.constantize if mapper_class.respond_to? :constantize

      Class.new(mapper_class) do
        instance_eval &block if block.present?
      end
    end

    def default_mapper
      CloudformationMapper::Mapper
    end

    # Value attributes
    def get_set_value key, method = key.to_s.underscore.to_sym, default_val = nil, &block_handler
      block_handler ||= lambda do |source_mapper, val = nil, &block|
        if block.present?
          val = block.call
        else
          val
        end
      end

      define_method method do |val = nil, &block|
        val = block_handler.call self, val, &block

        unless val.nil?
          attributes[key] = val
        end

        if attributes.key? key
          attributes[key]
        elsif not default_val.nil?
          attributes[key] = default_val.duplicable? ? default_val.clone : default_val
        else
          default_val
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

      define_method singular do |val = nil, &block|
        memo = send(method)

        if block.present?
          val = block.call if block.present?
        end

        yield memo, val unless val.nil?
      end
    end

    # Mapper attributes
    def get_set_mapping key, mapper_class = default_mapper, method = key.to_s.underscore.to_sym, default_val = nil, &block
      if defined? yield
        yield mapper_class = item(mapper_class)
      end

      get_set_value key, method, default_val do |source_mapper, val = nil, &block|
        if block.present?
          mapper = if !val.nil?
                     val
                   elsif source_mapper[key].present?
                     source_mapper[key]
                   else
                     mapper_class
                   end

          val = item(mapper, &block)
        else
          val
        end
      end
    end

    def append_mapping_hash key, mapper_class = default_mapper, method = key.to_s.underscore.to_sym, singular = method.to_s.singularize.to_sym
      if defined? yield
        yield mapper_class = item(mapper_class)
      end

      append_mapping key, mapper_class, method, singular, {} do |hash, val|
        if hash.key? val.name
          hash[val.name] = hash[val.name].merge val
        else
          hash[val.name] = val
        end
      end
    end

    def append_mapping_array key, mapper_class = default_mapper, method = key.to_s.underscore.to_sym, singular = method.to_s.singularize.to_sym
      if defined? yield
        yield mapper_class = item(mapper_class)
      end

      append_mapping key, mapper_class, method, singular, [] do |array, val|
        array << val
      end
    end

    def append_mapping key, mapper_class, method, singular, initial_memo, &accumulator
      get_set_value key, method, initial_memo

      define_method singular do |val = nil, &block|
        memo = send(method)

        # If a block is passed, it is evaluated in the context of a new mapper
        # class. val becomes the class to inherit from, defaulting to mapper_class
        # if not passed.
        if block.present?
          val = item(( val || mapper_class), &block)
        end

        accumulator.call memo, val if val.present?
      end
    end
  end
end
