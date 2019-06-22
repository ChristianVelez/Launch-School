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

p palindrome?('356653')