require 'active_support'

class Module
  def included(base)
    bases << base
  end

  def bases
    @bases ||= []
  end

  def poke_bases(m)
    bases.each do |b|
      b.module_eval do
        include(m)
        poke_bases(m)
      end
    end
  end

  def name_without_namespace
    name.gsub(/.*::/, '')
  end

  def bury
    parent.__send__(:remove_const, name_without_namespace)
  end

  def reincarnate
    buried = bury
    reborn = parent.const_set(name_without_namespace, Module.new)
    poke_bases(reborn)
    reborn.module_eval { include buried }
  end
end

class Class
  def reincarnate
    parent.const_set(name_without_namespace, Class.new(bury))
  end
end
