# Method naming follows the same conventions as variable naming:
# - snake case (all lower case + underscroe in place spaces)
# - all lower case
# - can't start the name with a number
def multiply(a, b = 1)
  a * b
end

puts multiply(4,5)
puts multiply 5,6

def greeting
  "Hello"
end

puts greeting

greeting = "Hello"

puts greeting

def addition(a, b)
  a + b
end

puts addition 1, 2

def greeting(name)
  "Hello #{name.capitalize}!"
end

puts greeting("codecore")

# You can add a question mark at the end of a method name
# it doesn't do anything special, it's a convention for methods
# that return true or false
def is_valid?

end

# you can also add a ! mark to the method
# it doesn't do anything special, it's a convention for methods
# that are doing something "destructive" or "dangerous"
def save!

end

def by_five?(number)
  number % 5 == 0
end

puts by_five?(15)
puts by_five?(13)
