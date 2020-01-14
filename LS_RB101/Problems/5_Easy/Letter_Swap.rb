=begin
Given a string of words separated by spaces, write a method that 
takes this string of words and returns a string in which the first 
and last letters of every word are swapped.

You may assume that every word contains at least one letter, and 
that the string will always contain at least one word. You may also 
assume that each string contains nothing but words and spaces

Examples:

swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
swap('Abcde') == 'ebcdA'
swap('a') == 'a'

=end

def swapped(word)
  word[0], word[-1] = word[-1], word[0]
end

def swap(words)
  result = words.split.each { |word| swapped(word) }
  puts result.join(" ")
end

swap('Abcde')
swap('Oh what a wonderful day it is')
swap('a')