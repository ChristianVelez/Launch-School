=begin
Write a method that takes one argument, 
a positive integer, and returns a list 
of the digits in the number.

Examples:

puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list(7) == [7]                     # => true
puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4]             # => true
=end

=begin
 Take the input, which will be an integer
 and turn into a string which can be split
 into an array of individual string characters
 that can then be mapped into an array of integers
 which will be our return value 
=end

def digit_list(nums)
  nums.to_s.split('').map(&:to_i)
end
p digit_list(444) == [4, 4, 4]

=begin
  Same as above but with a few modifications
  Instead of spliting the string into an array 
  of individual characters with the split method
  we can instead use the chars method which will
  do the same.  Finally we ommit the block used 
  with the map method and pass in the to_i method
  as argument to map that will do the
=end

def digit_list_2(nums)
  nums.to_s.chars.map(&:to_i)
end