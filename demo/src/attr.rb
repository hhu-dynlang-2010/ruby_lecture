class A
  attr_accessor :foo
end
describe A do
  describe '#foo=' do
    it 'should set the instance variable' do
      subject.foo = 'bar'
      subject.instance_variable_get(:@foo).should == 'bar'
    end
  end

  describe '#foo' do
    it 'should read the instance variable' do
      subject.instance_variable_set(:@foo, 'lorem')
      subject.foo.should == 'lorem'
    end
  end
end

class Class
  def my_attr_accessor(name)

    define_method("#{name}=") do |value|
      instance_variable_set("@#{name}", value)
    end

    define_method(name) do
      instance_variable_get("@#{name}")
    end

  end
end

class B
  my_attr_accessor :foo
end

describe B do
  describe '#foo=' do
    it 'should set the instance variable' do
      subject.foo = 'bar'
      subject.instance_variable_get(:@foo).should == 'bar'
    end
  end

  describe '#foo' do
    it 'should read the instance variable' do
      subject.instance_variable_set(:@foo, 'lorem')
      subject.foo.should == 'lorem'
    end
  end
end
