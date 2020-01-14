=begin

ASCII String Value

Write a method that determines and returns the ASCII string value 
of a string that is passed in as an argument. The ASCII string value 
is the sum of the ASCII values of every character in the string. 
(You may use String#ord to determine the ASCII value of a character.)

ascii_value('Four score') == 984
ascii_value('Launch School') == 1251
ascii_value('a') == 97
ascii_value('') == 0

Further Exploration

There is an Integer method such that:

char.ord.mystery == char
where mystery is our mystery method. Can you determine what method 
name should be used in place of mystery? What happens if you try this 
with a longer string instead of a single character?
 
=end

def ascii_value(str)
  str_arr = str.chars
  ascii_arr = str_arr.map { |char| char.ord }
  result = ascii_arr.reduce(:+)

  puts result
end

# ascii_value("Launch School")

puts "a".ord.chr == "a" # Further Exploration

