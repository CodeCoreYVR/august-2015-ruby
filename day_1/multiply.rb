# We need to add .to_i at the end of it because the gets
# command gives us back a string even if the user enters a number
number_1 = gets.chomp.to_i

number_2 = gets.chomp.to_i

puts "Answer is: #{number_1 * number_2}"
