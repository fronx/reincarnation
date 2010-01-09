require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "an included module" do
  module A
    def foo
      "foo"
    end
  end

  module B; include A; end
  module C; include B; end
  module D; include B; end

  it "should still be included after reincarnation" do
    A.reincarnate
    module A
      def foo
        super*2
      end
    end

    class ATestB; include B; end
    ATestB.new.foo.should == "foofoo"

    class ATestC; include C; end
    ATestC.new.foo.should == "foofoo"

    class ATestD; include D; end
    ATestD.new.foo.should == "foofoo"

    A.reincarnate
    module A
      def foo
        super + bar
      end
    end

    module B; def bar; "B"; end; end
    module C; def bar; "C"; end; end
    module D; def bar; "D"; end; end

    ATestB.new.foo.should == "foofooB"
    ATestC.new.foo.should == "foofooC"
    ATestD.new.foo.should == "foofooD"
  end
end
