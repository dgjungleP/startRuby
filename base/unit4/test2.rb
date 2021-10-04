# frozen_string_literal: true

require_relative 'stack_like'

class Suitcase
end

class CargoHold
  include StackLike

  def load_and_report(obj)
    print 'Loading object'
    puts obj.object_id
    add_to_stack(obj)
  end

  def unload
    take_from_stack
  end
end

hold = CargoHold.new

sc1 = Suitcase.new
sc2 = Suitcase.new
sc3 = Suitcase.new
sc4 = Suitcase.new

hold.load_and_report(sc1)
hold.load_and_report(sc2)
hold.load_and_report(sc3)
hold.load_and_report(sc4)

unload = hold.unload
puts 'The first suitcase off the plane is ...'
puts unload.object_id
