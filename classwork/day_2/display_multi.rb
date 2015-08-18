array = [[1,2,3], [4,5,6], [7,8,9]]

array.flatten.each do |x|
  puts x
end

puts array.flatten

array.flat_map {|x| puts x }

puts "#{array.join}"

array.each do |x|
  # x.each {|y| puts y }
  x.each do |y|
    puts y
  end
end

array.each {|x| x.each {|y| puts y }}
