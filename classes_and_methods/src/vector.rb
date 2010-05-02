class Vector
  def initialize(values)
    @values = values
  end

  def *(other)
    b = Array.new(@values.length)
    for i in (0...@values.length)
      b[i] = @values[i] * other
    end
    Vector.new(b)
  end

  def values()
    @values
  end
end

class Fixnum
  alias mult *
  def *(other)
    if other.is_a?(Vector)
      other * self
    else
      self.mult(other)
    end
  end
end

describe Vector do
  subject {Vector.new([1,2,3])}

  its(:values) { should == [1,2,3] }

  describe 'scalar multiplication' do
    it 'should multiply with the scalar as right operand' do
      r = subject * 3
      r.values().should == [3, 6, 9]
    end

    it 'should multiply with the scaler as left operand' do
      r = 4 * subject
      r.values().should == [4, 8, 12]
    end
  end
end

describe Fixnum do

  it 'should multiply numbers as expected' do
    (3 * 7).should == 21
  end

  describe '.mult' do
    it 'behave as *' do
      3.mult(7).should == 21
    end
  end
end
