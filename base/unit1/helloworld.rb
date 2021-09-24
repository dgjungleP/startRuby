def hello
  puts "hello world!"
end

hello

def hello(name)
  puts "hello #{name}"
end

hello("jungle")

class Player
    def initialize(name="Jungle")
        @name =name
    end

    def show
        puts "hello #{@name}"
    end
end

Player.new("Kity").show