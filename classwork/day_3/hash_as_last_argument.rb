def first_value(hash = {})
  # hash.first returns and array of the first key-value pair [:a, 1]
  hash.first[1]
end

puts first_value({a: 1, b: 2}) # should return 1
puts first_value a: 1, b: 2    # this is the same as the one above
                               # you're passing a single hash argument
