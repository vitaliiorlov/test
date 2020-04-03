shared_examples 'only string as argument' do |klass, exception_klass|
  it "should raise error if nil passed" do
    expect { klass.new(nil) }.to raise_error(an_instance_of(exception_klass))
  end
  
  it "should raise error if Integer passed" do
    expect { klass.new(123) }.to raise_error(an_instance_of(exception_klass))
  end
end