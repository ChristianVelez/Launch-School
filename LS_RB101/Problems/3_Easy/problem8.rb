=begin
  
Write a program that returns true if the 
string passed as an argument is a palindrome, 
false otherwise. A palindrome reads the same 
forward and backward. For this exercise, 
case matters as does punctuation and spaces.

Example:

palindrome?('madam') == true
palindrome?('Madam') == false          # (case matters)
palindrome?("madam i'm adam") == false # (all characters matter)
palindrome?('356653') == true
  
=end

def format_string(str)
  str.chars.reverse.join('')
end

def palindrome?(str)
  new_str = format_string(str)
  new_str == str
end

p palindrome?('madam')
p palindrome?('Madam')
p palindrome?("madam i'm adam")
p palindrome?('356653')


=begin 

  Approach:

  As we already know, a palindrome reads the same forwards and backwards. With
  this in mind, we are asked to take a string input and check to see if it is
  a palindrome.

  In an effort to make the business logic a bit more legible and easier to
  understand, I decided to split the code into to two methods.  The first
  method, format_str(str), will take the string input, split into individual
  characters, reverse those characters and finally join them back into a 
  single string.

  This output is then passed on to our second method, palindrome?(str), where
  we assign it to a variable called new_str.  Finally we do an an equality
  check (==) between our reversed string and our original string where the
  the output of this palindrome?(str) method will be a boolean.  Simply, true
  if it is a palindrome or false if it is not.

=end

# Further Exploration

def format_input(input)
  input.reverse
end

def palindrome?(input)
  new_input = format_input(input)
  new_input == input
end

p palindrome?(['a', 'b', 'a']) 
p palindrome?([1,2,3,2,1])
p palindrome?("madam")
p palindrome?([1,2,3,2])

=begin
  
  This method has been expanded to also allow for arrays as inputs.

  It is the same exact code as the original method, we simply changed the
  variable names from str to input to reflect the many ways in which this
  can be provided to our methods.

=end