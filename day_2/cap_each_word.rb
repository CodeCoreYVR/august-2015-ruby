# Solution 1
print "Give me a sentence"

sentence = gets.chomp

words              = sentence.split
new_sentence_array = []

words.each do |word|
  new_sentence_array << word.capitalize
end

puts new_sentence_array.join(" ")

# Solution 2
print "Give me a sentence"

b = gets.chomp.split

b.each {|x| print x.capitalize, " " }
