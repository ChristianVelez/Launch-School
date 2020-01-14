=begin
  
Write a method that takes two strings as arguments, 
determines the longest of the two strings, and then 
returns the result of concatenating the shorter string, 
the longer string, and the shorter string once again. 

You may assume that the strings are of different lengths.

Examples:

short_long_short('abc', 'defgh') == "abcdefghabc"
short_long_short('abcde', 'fgh') == "fghabcdefgh"
short_long_short('', 'xyz') == "xyz"
  
=end

def short_long_short(str1, str2)
  strings = [str1, str2]
  short, long = strings.sort_by{ |str| str.size }
 

  puts short + long + short
end

short_long_short('abc', 'defgh')
short_long_short('abcde', 'fgh')
short_long_short('', 'xyz')

=begin
  
  Approach:

  We are tasked with determining the length of two strings
  and displaying them in the following order:

  short + long + short

  I decided to create an array to hold the two strings which
  would give me access to array methods and a more concise
  way to handle the input.

  We save the two strings into an array we call strings and 
  we then sort the strings values in the array by length.

  Finally we use array destructuring to save those values into
  two variables called short and long where short holds the smallest
  string value and long....well the longest.

  We simply output our result.
  
=end