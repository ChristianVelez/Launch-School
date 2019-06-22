=begin
  
Write a method that returns true if its integer 
argument is palindromic, false otherwise. 
A palindromic number reads the same forwards and backwards.
  
=end

def format_input(num)
  num.to_s.chars.join
end

def palindromic_number?(num)
  original   = format_input(num)
  comparison = format_input(original).reverse

  original == comparison
end

p palindromic_number?(34543)
p palindromic_number?(123210)
p palindromic_number?(22)
p palindromic_number?(5)