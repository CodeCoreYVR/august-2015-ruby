names     = %w(john jim tom jennifer)
cap_names = []

names.each do |name|
  y = name.capitalize
  cap_names << y
  puts y
end
