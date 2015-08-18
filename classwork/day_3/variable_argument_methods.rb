def sum(*numbers)
  print numbers
end

sum
sum 1,2,3
sum 1
sum 4,5,6,7,9

def multiply(a, *b)
  result = a
  b.each {|x| result *= x}
  result
end

puts multiply 2,3,4
puts multiply 2
puts multiply 5,6,7,8,9

def get_max(*numbers)
  # numbers.max_by {|x| x}
  numbers.max
end

puts get_max 1,3,4,34,4,3
puts get_max 1,3,4,34,4,300
