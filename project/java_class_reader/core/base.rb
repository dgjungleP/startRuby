# frozen_string_literal: true
module HexString
  attr_accessor :value

  def initialize(*value)
    @value = value.flatten
  end

  def toHexString
    char = %w[0 1 2 3 4 5 6 7 8 9 A B C D E F G]
    result = ''
    @value.each.reverse_each do |str|
      v = str & 0xff
      while v.positive?
        c = v % 16
        v = v >> 4
        result = char[c] + result
      end
      result = "0#{result}" if result.size & 0x01 == 1
    end
    "0x#{result.size.zero? ? '00' : result}"
  end
end

class U1
  include HexString

  def to_i
    @value[0] & 0xff
  end
end

class U2
  include HexString

  def to_i
    (@value[0] & 0xff) << 8 | (@value[1] & 0xff)
  end
end

class U4
  include HexString

  def to_i
    (@value[0] & 0xff) << 24 | (@value[1] & 0xff) << 16 | (@value[2] & 0xff) << 8 | (@value[4] & 0xff)
  end
end

