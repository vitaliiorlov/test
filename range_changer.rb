class RangeChanger
  attr_reader :value
  
  def initialize(value)
    raise ArgumentError, 'invalid argument' unless value.is_a?(String)
    @value = value
  end
  
  def change
    result = []
    dash = '-'
    bytes = value.bytes
    bytes.each_with_index do |byte, i|
      if i.zero?
        result << byte.chr
        next
      end
      prev_byte = bytes[i - 1]
      next_byte = bytes[i + 1].to_i
      a = prev_byte - byte
      b = byte - next_byte
      is_range_now = a == b && [-1, 1].include?(a)
      if result.last != dash && is_range_now
        result << dash
      elsif is_range_now
        next
      else
        result << byte.chr
      end
    end
    
    result.join
  end
end