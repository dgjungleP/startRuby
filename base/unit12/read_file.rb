# frozen_string_literal: true

f = File.new('./hello.txt')
# read = f.read
# puts read
puts f.readline
puts f.readline
file_new = File.new('./sout.out', 'w')
file_new.puts 'Hello Jungle';
