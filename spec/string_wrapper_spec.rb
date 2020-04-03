require_relative '../string_wrapper'
require_relative 'support/shared_examples/argument_examples'

RSpec.describe StringWrapper do
  before do
    @test_str = 'To be or not to be that is the question'
    @test_res = "To be\nor\nnot\nto be\nthat\nis\nthe\nquest\nion"
  end
  
  it "should wrap the long lines in the given text to the given length" do
    expect(StringWrapper.new(@test_str).wrap(5)).to eq @test_res
  end
  
  it "should not wrap string if length is less than needed" do
    expect(StringWrapper.new(@test_str).wrap(@test_str.length + 1)).to eq @test_str
  end
  
  context "arguments" do
    include_examples 'only string as argument', StringWrapper, ArgumentError
    
    it "should raise error if not integer passed" do
      expect { StringWrapper.new(@test_str).wrap('abc') }.to raise_error(an_instance_of(ArgumentError))
    end
  end
end