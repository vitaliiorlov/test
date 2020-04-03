class StringWrapper
  attr_reader :value
  
  def initialize(value)
    raise ArgumentError, 'invalid argument' unless value.is_a?(String)
    @value = value
  end
  
  def wrap(int)
    raise ArgumentError, 'invalid argument' unless int.is_a?(Integer)
    return value if value.length <= int
    value.split(' ').each_with_object(['']) do |word, result|
      if "#{result.last} #{word}".length <= int
        last_word = result.pop
        result << process_depends_on_prev_word(word, last_word)
      elsif word.length <= int
        result << word
      else
        result << process_big_word(word, int)
      end
    end.flatten.join("\n")
  end
  
  private
  
  def process_depends_on_prev_word(word, last_word)
    return word if last_word.empty?
    "#{last_word} #{word}"
  end
  
  def process_big_word(word, int)
    word.scan(/.{1,#{int}}/)
  end
end