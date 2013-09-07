# reincarnation

monkey patch existing class and modules with the added comfort of "super". in other words: you shouldn't even consider using this.

example for classes:

    require 'reincarnation'

    class Abc
      def foo
        "foo"
      end
    end
 
    Abc.reincarnate
 
    class Abc
      def foo
        puts super
      end
    end
 
    Abc.new.foo

example for modules:

    require 'reincarnation'

    module Boo
      def bar
        "bar"
      end
    end

    Boo.reincarnate

    module Boo
      def bar
        puts super
      end
    end

    class BooTest
      include Boo
    end

    BooTest.new.bar

MIT license
