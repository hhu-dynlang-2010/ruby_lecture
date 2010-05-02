class PyObject
  def initialize(attrs)
    @dict = attrs
  end

  def method_missing(name, *args)
    if @dict.include?(name.to_s)
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
end
