my_hash = { "British Columbia": ["Vancouver", "Richmond"],  "AB" => ["Edmonton", "Calgary"]}

my_hash.each do |province, cities|
  # puts "#{province}: #{cities[0]}, #{cities[1]}"
  puts "#{province}: #{cities.sort.join(", ")}"
end
