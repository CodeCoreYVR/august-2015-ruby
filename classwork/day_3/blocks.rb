def my_method
  puts "Hello"
  # this will execute the block given to the method
  yield if block_given?
  puts "Bye"
end

my_method do
  puts ">>>>>>>>"
  puts "CALLING BLOCK WITH DO/END"
  puts ">>>>>>>>"
end

my_method { puts ">>>>>> CALLING WITH {}" }

my_method

# With Hash Arguements

def my_method(hash = {})
  puts "Hello #{hash[:name]}"
  # this will execute the block given to the method
  yield if block_given?
  puts "Bye"
end

my_method name: "Tam" do
  puts ">>>>>>>>"
  puts "CALLING BLOCK WITH DO/END"
  puts ">>>>>>>>"
end

my_method({name: "Tam"}) { puts ">>>>>> CALLING WITH {}" }

my_method
