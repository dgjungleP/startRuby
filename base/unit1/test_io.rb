puts 'Hello, i will read the file for the data...!'

num = File.read('temp.dat')

fah = (num.to_i * 9 / 5) + 32

puts 'Read the number is ' + num

puts 'Now save the data in the file ...'

fh = File.new('temp.out', 'w')

fh.puts fah

fh.close
