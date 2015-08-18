require "./bird.rb"
require "./cat.rb"

100.times do
  puts ">>>>>>>>>>>>>>>"
  tom = Cat.new("Tom")
  tam = Bird.new("Tam")
  puts tom.catch(tam)
  puts tom.eat
  puts ">>>>>>>>>>>>>>>"
end
