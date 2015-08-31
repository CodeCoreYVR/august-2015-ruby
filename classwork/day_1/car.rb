print "Please enter the year your car was made in"

year = gets.to_i

if year > 2015
  puts "Your car is from the future"
elsif year == 2015
  puts "Your car is in the present year"
elsif year > 2000
  puts "Your car is new-ish"
else
  puts "Your car is from the past"
end
