print "Please present a sentence"

print gets.chomp.split.map {|x| x.capitalize }.join(" ")

gets.chomp.split.each {|x| print x.capitalize, " " }
