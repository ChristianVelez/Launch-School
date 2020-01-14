=begin
  
In the previous two exercises, you developed methods 
that convert simple numeric strings to signed Integers. 
In this exercise and the next, you're going to reverse 
those methods.

Write a method that takes a positive integer or zero, 
and converts it to a string representation.

You may not use any of the standard conversion methods 
available in Ruby, such as Integer#to_s, S
tring(), Kernel#format, etc. Your method should do this 
the old-fashioned way and construct the string by 
analyzing and manipulating the number.

Examples

integer_to_string(4321) == '4321'
integer_to_string(0) == '0'
integer_to_string(5000) == '5000'
  
=end

INTEGERS = { 0 => "0", 1 => "1", 2 => "2", 
             3 => "3", 4 => "4", 5 => "5", 
             6 => "6", 7 => "7", 8 => "8",
             9 => "9" }

def split_numbers(numbers)
  num_array = []
  
  loop do
    digit = numbers % 10
    numbers = numbers / 10
    
    num_array << digit 
    break if numbers.zero?
    numbers
  end
  num_array.reverse
end

def integer_to_string(nums)
  num_array = split_numbers(nums)
  result = num_array.map { |num| INTEGERS[num] }

  result.join 
end

#integer_to_string(4321)

=begin
  
 Approach:

 We are tasked with creating a method that will take an integer
 and return its string representation.

 Input will be positive so we won't have to worry about checking
 for negative or positive numbers.

 We will first create a hash named INTEGERS that will hold a set
 of key value pairs of integers and their string equivalents, from
 0-9.

 We then will create a method that will help us split an integer
 into individual numbers.  This method will be called
 split_numbers(nums) and will take an integer as input.

 In order to split an integer into individual numbers, we will
 create a loop where we will apply the modulo operator to our
 integer, num % 10, where there result of this operation will
 be the last number from our integer, which is saved to a 
 variable called digit, which is then pushed into an empty 
 array where we will store our individual numbers.  After
 applying the modulo operator to our integer, we will then divide
 the integer by 10, num / 10, which will return the integer
 minus the last digit.  This operation will grab the last number
 of our integer until nothing is left, which is why num < 0
 is our break condition.  This method will return an array
 of individual numbers.

 Using the array returned by the split_numbers method, we will
 pass this to our main method, integer_to_string(num)
 where we will simply grab the string equivalent of our integers
 and join them into a single string.
=end









