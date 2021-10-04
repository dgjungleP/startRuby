# frozen_string_literal: true

module MyFiendModule
  def say_hello
    puts 'Hello'
  end
end

class MyFiend
  include MyFiendModule
end

mt = MyFiend.new
mt.say_hello

require_relative 'stack_like'

class Stack
  include StackLike
end

stack = Stack.new
stack.add_to_stack(1)
stack.add_to_stack(2)
stack.add_to_stack(3)
stack.add_to_stack(4)
stack.add_to_stack(5)

puts 'All put in stack!'

puts stack.stack

t = stack.take_from_stack

puts t

puts stack.stack


