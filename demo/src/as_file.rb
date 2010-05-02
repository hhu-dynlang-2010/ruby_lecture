class String
  def as_file(m='r')
    f = File.new(self, m)
    if block_given?
      r = yield f
      f.close
      r
    else
      f
    end
  end
end

# With block capturing
class String
  def as_file(m='r', &block)
    File.open(self, m, &block)
  end
end

describe String do
  def next
    @i ||= 0
    @i += 1
  end
  before(:each) do
    @subject = "test_#{self.next}.txt"
  end

  it 'should write to the file if the flag if given' do
    @subject.as_file('w') do |f|
      f << 'foo'
    end
    File.new(@subject).read().should == 'foo'
  end

  it 'should read the file' do
    File.open(@subject, 'w') do |f|
      f.write('bar')
    end
    @subject.as_file do |f|
      f.read
    end.should == 'bar'
  end

  it 'should return the file if no block is given' do
    subject.as_file.should be_a(File)
  end
end
