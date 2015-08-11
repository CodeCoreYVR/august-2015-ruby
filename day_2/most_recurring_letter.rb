print "Give me a string: "

sentence = gets.chomp

characters = sentence.chars

# We generate the Hash using Hash.new because we want the default
# frequency to be 0
frequencies = Hash.new(0) # {a: 10, b: 2}

# we construct the frequencies hash by incrementing the recurrance
# value
characters.each do |letter|
  frequencies[letter] += 1
end

# we use the sort_by method which generate an array of arrays
# sorted by the hash value. We get the last one (most recurring)
# which will be a hash like ["a", 10] then we get the first element
# of that array which will be the most recurring letter
puts frequencies.sort_by {|k,v| v }.last[0]
