puts "Let's count to a 100, enter a number less than 100"
number = gets.to_i

# This will keep prompting the user to enter a number that
# is less than a 100
while number >= 100
  puts "too big, try again"
  number = gets.to_i
end


for x in number..100
  puts x
end
