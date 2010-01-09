require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "a class" do
  class A
    def foo
      "foo"
    end
  end

  it "should be reincarnable" do
    A.reincarnate
    class A
      def foo
        super*2
      end
    end
    A.new.foo.should == "foofoo"
  end
end

describe "a module" do
  module Boo
    def bar
      "bar"
    end
  end
  
  it "should be reincarnable" do
    Boo.reincarnate

    module Boo
      def bar
        super*2
      end
    end
    
    class BooTest
      include Boo
    end

    BooTest.new.bar.should == "barbar"
  end
end
