require_relative '../range_changer'
require_relative 'support/shared_examples/argument_examples'

RSpec.describe RangeChanger do
  it "should change ranges" do
    expect(RangeChanger.new('abcdab987612').change).to eq 'a-dab9-612'
  end
  
  it "should do not change if there are no ranges" do
    str = 'kfagnhekkw232skd33dkk'
    expect(RangeChanger.new(str).change).to eq str
  end
  
  include_examples 'only string as argument', RangeChanger, ArgumentError
end