print "Please enter your score"

score = gets.to_i

if score >= 90
  grade = "A"
elsif score >= 80
  grade = "B"
elsif score >= 70
  grade = "C"
elsif score >= 50
  grade = "D"
else
  grade = "F"
end

puts "The grade is: #{grade}"

grade = if score >= 90
          "A"
        elsif score >= 80
          "B"
        elsif score >= 70
          "C"
        elsif score >= 50
          "D"
        else
          "F"
        end
