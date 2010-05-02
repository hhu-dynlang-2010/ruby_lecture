require 'spec'
class PyObject
  def initialize(attrs)
    @dict = attrs
  end

  def method_missing(name, *args)
    if name.to_s[-1] == '='
      @dict[name.to_s[0...-1]] = args[0]
    elsif @dict.include?(name.to_s)
      @dict[name.to_s]
    else
      super
    end
  end
end
describe PyObject.new({"a" => "b"}) do
  it 'should return the value from the internal hash if present'  do
    subject.a.should == 'b'
  end
  it 'should raise NoMethodError if the key is not present' do
    lambda{ subject.buh }.should raise_error(NoMethodError)
  end

  it 'should set the key if assigned using =' do
    subject.lorem = 'ipsum'
    subject.lorem.should == 'ipsum'
  end
end
