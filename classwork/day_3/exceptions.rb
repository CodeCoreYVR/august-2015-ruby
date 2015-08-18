begin
  10 / 0
# This will catch any exception of any kind
rescue
  puts "Can't divide by Zero"
end

begin
  10 / 0
# This will catch any exception of any kind
# it will also give you an object exp that contains the error message
# and backtrace
rescue => exp
  puts "Exception Class: #{exp.class}"
  puts "Can't divide by Zero - original message: #{exp.message}"
  puts "Exception Backtrace: #{exp.backtrace}"
end

begin
  10 / 0
# this will only catch an exception of type ZeroDivisionError
# it will also give you an object e that contains the message
# and backtrace
rescue ZeroDivisionError => e
  puts "Can't divide by Zero - original Message: #{e.message}"
# this will catch exceptions not caught by previous rescue statement
rescue => e
  puts "Uknown error happened: #{e.message}"
end
