module M
  def report
    puts "'report' method in the module M."
  end
end

class C
  include M

end

class D < C

end

d = D.new
d.report

