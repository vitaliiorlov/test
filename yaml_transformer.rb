require 'yaml'

class YamlTransformer
  attr_reader :data
  
  def initialize(data = File.read('support/translations_simple.yml'))
    @data = data
  end
  
  def transform
    hash = Hash.new { |h, k| h[k] = Hash.new(&h.default_proc) }
    
    YAML.load(data).each do |keys, value|
      insert_to_hash(hash, keys, value)
    end
    
    hash.to_yaml.gsub("---\n", '')
  end
  
  private
  
  def insert_to_hash(hash, keys, value)
    arr_keys = keys.split('.')
    last_k = arr_keys.pop
    arr_keys.inject(hash) do |h, k|
      h[k]
    end[last_k] = value
  end
end