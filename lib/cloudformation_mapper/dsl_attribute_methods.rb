require 'active_support/inflector'

module CloudformationMapper::DslAttributeMethods
  private
  module NoVal; end
  def getter_setter name, default = nil
    var = "@#{name}".to_sym

    define_method name do |val = NoVal|
      unless val == NoVal
        instance_variable_set var, val
      end

      if instance_variable_defined? var
        instance_variable_get var
      else
        instance_variable_set var, default
      end
    end

    define_method "#{name}=" do |val|
      instance_variable_set var, val
    end
  end

  def append_mapping_hash name, singular = name.to_s.singularize.to_sym
    var = "@#{attr}".to_sym

    getter_setter name, {}

    define_method singular do |val|
      hash = send(name)

      hash[val.name] = val
    end
  end
end
