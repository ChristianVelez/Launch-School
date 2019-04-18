=begin

Write a method that takes one argument, a string containing one or 
more words, and returns the given string with all five or more letter
words reversed. Each string will consist of only letters and spaces. 
Spaces should be included only when more than one word is present.

Examples:

puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS

=end

# If string length is bigger than 5, reverse it
# if not, leave it alone 
def reverse_sentence(str)
  str.split.map { | word | word.length > 5 ? word.reverse : word }.join(" ")
end

p reverse_sentence("Professional")