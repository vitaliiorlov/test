require_relative '../yaml_transformer'
require_relative './helpers.rb'

RSpec.configure do |c|
  c.include Helpers
end

RSpec.describe YamlTransformer do
  before do
    @input = File.read(fixtures_path('translations_simple_example.yml'))
    @output = File.read(fixtures_path('translations_example.yml'))
  end
  
  it "should transform data to Rails yaml file" do
    expect(YamlTransformer.new(@input).transform).to eq @output
  end
  
end