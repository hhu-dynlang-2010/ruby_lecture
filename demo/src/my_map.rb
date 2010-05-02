class Array
  def my_map()
    raise ArgumentError unless block_given?
    i = 0
    a = []
    while i < self.length
      a << yield(self[i])
      i += 1
    end
    a
  end
end

class Array
  def my_map()
    raise ArgumentError unless block_given?
    Array.new(self.length) { |i|
      yield self[i]
    }
  end
end

describe Array do
  subject{[1,2,3,4]}

  describe '#my_map' do
    it 'should call the block on each item' do
      subject.my_map{ |v| v}.should == [1,2,3,4]
    end

    it 'should raise an error when no block is given' do
      lambda { subject.my_map() }.should raise_error(ArgumentError)
    end

    it 'should apply the code provided by the block on each item' do
      subject.my_map { |v| "value: #{v**2}" }.should == ['value: 1', 'value: 4', 'value: 9', 'value: 16']
    end
  end
end
