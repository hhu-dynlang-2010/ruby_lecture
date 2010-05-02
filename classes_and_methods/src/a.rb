require 'spec'

class A
  def initialize()
    @i = 123
  end

  def i=(v)
    @i = v
  end

  def i()
    @i
  end
end

class B < A
  def hi()
    @i + 10
  end
end

describe A do
  before(:each) do
    @a = A.new
  end
  its(:i) do
    @a.i = 10
    @a.i.should == 10
  end
  its 'default i' do
    @a.i.should == 123
  end
end

describe B do
  subject do
    b = B.new
    b.i = 13
    b
  end

  it { should be_a_kind_of(A) }

  its(:hi) { should == 23 }
end
