print "Give me a number: "

number = gets.to_i

# if(number > 10)
if number > 10
  # if the given expression evaluates to true then this code will execute
  puts "The number is large"
elsif number > 5
  puts "The number is medium"
else
  # if the given expression evalutes to false then this code will execute
  # in Ruby everything will evaluate to true except for false and nil
  puts "The number is small"
end
