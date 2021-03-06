require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "a namespaced class" do
  module M
    class A
      def foo
        "foo"
      end
    end
  end

  it "should be reincarnable" do
    M::A.reincarnate
    module M
      class A
        def foo
          super*3
        end
      end
    end

    M::A.new.foo.should == "foofoofoo"
  end
end

describe "a namespaced module" do
  module M
    module B
      def bar
        "bar"
      end
    end
  end

  it "should be reincarnable" do
    M::B.reincarnate
    module M
      module B
        def bar
          super*3
        end
      end
    end

    class BTest
      include M::B
    end

    BTest.new.bar.should == "barbarbar"
  end
end
