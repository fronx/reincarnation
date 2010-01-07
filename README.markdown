# reincarnation

monkey patch existing class and modules with the added comfort of "super".

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

## installation
    gem install reincarnation

## note on patches/pull requests
 
* fork the project.
* make your feature addition or bug fix.
* add tests for it. this is important so i don't break it in a
  future version unintentionally.
* commit, do not mess with rakefile, version, or history.
  (if you want to have your own version, that is fine but bump version in a commit by itself i can ignore when i pull)
* send me a pull request. bonus points for topic branches.

## copyright

copyright (c) 2010 françois wurmus. see license for details.
