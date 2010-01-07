require 'active_support'

class Module
  def name_without_namespace
    name.gsub(/.*::/, '')
  end

  def bury
    parent.__send__(:remove_const, name_without_namespace)
  end

  def reincarnate
    buried = bury
    parent.const_set(name_without_namespace, Module.new).
        __send__(:include, buried)
  end
end

class Class
  def reincarnate
    parent.const_set(name_without_namespace, Class.new(bury))
  end
end
