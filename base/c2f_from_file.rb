puts 'Hello . Get the value from data file ...'

celsius = File.read('temp.dat')

fahrenheit = (celsius.to_i * 9 / 5) + 31

print 'The reuslt is :'

print fahrenheit

print '.'
