class Array
  def my_each
    c = 0
    until c == size
      yield(self[c])
      c += 1
    end
    self
  end
end

array = [1, 2, 3, 4, 5]

array.my_each { |e| puts "this is #{e}" }

class Integer
  # def my_times
  #   c = 0
  #   until c == self
  #     yield(c)
  #     c += 1
  #   end
  #   self
  # end

  def my_times
    Array.new(self).fill { |i| i + 1 }.my_each { |e| yield(e - 1) }
    self
  end
end

5.my_times { |e| puts "this is #{e}" }