=begin
  
Write another method that returns 
true if the string passed as an 
argument is a palindrome, false 
otherwise. This time, however, 
your method should be case-insensitive, 
and it should ignore all non-alphanumeric 
characters. If you wish, you may simplify 
things by calling the palindrome? method
you wrote in the previous exercise.

examples:

real_palindrome?('madam') == true
real_palindrome?('Madam') == true           # (case does not matter)
real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
real_palindrome?('356653') == true
real_palindrome?('356a653') == true
real_palindrome?('123ab321') == false
  
=end

# def remove_non_alphanumerics(str)
#   str.scan(/\w+/).join
# end

# def real_palindrome?(str)
#   original   = remove_non_alphanumerics(str).downcase
#   comparison = remove_non_alphanumerics(original).reverse.downcase

#   puts original == comparison
# end

# real_palindrome?('madam')
# real_palindrome?('Madam')
# real_palindrome?("Madam, I'm Adam")
# real_palindrome?('356653')
# real_palindrome?('356a653')
# real_palindrome?('123ab321')


=begin

  Approach:

  This problem set requires us to take a string input and determine if it
  is a palindrome.  Similar to the last problem, this version has a few 
  more rules in place.

  First, we must ignore all non-alphanumeric characters and second, our 
  method must return a case insentive output.

  With that in mind, once again, I decided to split the operation into
  two methods.  The first method, remove_non_alphanumerics(str), would
  use the String#scan method to remove all non-alphanumeric characters
  with a regular expression "(/\w+/)" and finally join the string back
  together via the String#join method.

  Next, we will create our next method called real_palindrome?(str),
  where we will create two variables named "orginal" and "comparison".

  We will apply our our remove_non_alphanumeric(str) method to both variables
  and apply the String#downcase method to both, to assure case insensitivity.

  This will result in both our variables having all non-alphanumeric
  characters being removed from our input while also converting it to all
  lowercase characters.  Finally, we apply the String#reverse method to our
  "comparison" variable and perform an equality check (==) on both our variables
  to determine if it is indeed a palindrome.  Same as with the previous exercise,
  the final output of this method will be a boolean.
=end

