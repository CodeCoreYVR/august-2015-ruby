my_lambda   = lambda { puts "I'm a lambda" }
my_lambda_1 = lambda { puts "I'm a lambda 1" }
puts my_lambda.call

def my_method(*codes)
  puts ">>>>>> START"
  codes.each {|code| code.call }
  puts ">>>>>> END"
end

my_method(my_lambda, my_lambda_1)

# Difference between Procs & Lambdas
# Proc treats argument as optional and will be nil if not provided
lam = lambda {|x| puts "#{x}" }
lam.call("Hello") # will work
lam.call          # will throw an exception

my_proc = proc {|x| puts "#{x}" }
my_proc.call("Hello") # will work
my_proc.call          # will work

# Lambdas accept having return inside them, procs don't
lam = lambda { return }
lam.call # will work

my_proc = proc { return }
my_proc.call # will throw and exception
