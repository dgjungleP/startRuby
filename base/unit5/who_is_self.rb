puts "Top Level"
puts "Self is #{self}"

class C
  puts "Class definition block:"
  puts "Self is #{self}"

  def self.x
    puts "Class Method C.x"
    puts "Self is #{self}"
  end

  def m
    puts "Instance method C#m"
    puts "Self is #{self}"
  end
end

C.x
C.new.m

