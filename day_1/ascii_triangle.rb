print "give me a number: "

number = gets.to_i

counter = 1

until counter > number
  # print " " * (number - counter), "O " * counter, "\n"
  puts "#{" " * (number - counter)}#{'O ' * counter}"
  counter += 1
end
