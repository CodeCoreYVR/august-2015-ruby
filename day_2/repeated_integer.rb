# this will generate an array that have numbers 1 to 1000000
numbers = (1..1000000).to_a

# this will add a random element from the array back to itself
numbers << numbers.sample

numbers.shuffle!

before_time = Time.now
# Solution 1
frequencies = Hash.new(0)
# {1 => 1, 2 => 1}

numbers.each do |number|
  if frequencies[number] == 0
    frequencies[number] = 1
  else
    puts "#{number} is repeated"
    # this will stop the loop from continuing. Because we don't need to
    # continue looping once we've found the repeated integer
    break
  end
end
after_time = Time.now
puts "Solution one took #{(after_time - before_time) * 1000}"

# Solution 2
numbers.sort!

numbers.each do |x|
  if x == numbers[x]
    puts "#{x} is repeated"
    break
  end
end

# Solution 3
size = numbers.count

for ind in 0...size
  if numbers[numbers[ind].abs] > 0
    numbers[numbers[ind].abs]=  -(numbers[numbers[ind].abs])
  else
    puts "#{numbers[ind].abs} is repeated"
    break
  end
end
