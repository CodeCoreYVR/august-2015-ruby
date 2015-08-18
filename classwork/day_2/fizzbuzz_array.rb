array = []

for x in 1..100
  if x % 3 == 0 && x % 5 == 0
    array << "FIZZBUZZ"
  elsif x % 5 == 0
    array << "BUZZ"
  elsif x % 3 == 0
    array << "FIZZ"
  else
    array << x
  end
end

# print is better for display arrays than puts
# puts array
print array
