=begin 

In the previous exercise, you developed a method that 
converts non-negative numbers to strings. In this exercise, 
you're going to extend that method by adding the ability 
to represent negative numbers as well.

Write a method that takes an integer, and converts it to a 
string representation.

You may not use any of the standard conversion methods 
available in Ruby, such as Integer#to_s, String(), Kernel#format, etc. 
You may, however, use integer_to_string from the previous exercise.

Examples

signed_integer_to_string(4321) == '+4321'
signed_integer_to_string(-123) == '-123'
signed_integer_to_string(0) == '0'

=end

#require './NumbertoString.rb'

INTEGERS = { 0 => "0", 1 => "1", 2 => "2", 
             3 => "3", 4 => "4", 5 => "5", 
             6 => "6", 7 => "7", 8 => "8",
             9 => "9" }

def prompt(message)
  p "#{message}"
end  

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
  nums = nums.negative? ? nums.abs : nums
  num_array = split_numbers(nums)
  result = num_array.map { |num| INTEGERS[num] }

  result.join 
end

def signed_integer_to_string(num)
 result = integer_to_string(num)

 return prompt(result) if num.zero?
 return prompt(result.prepend("-")) if num.negative?
 return prompt(result.prepend("+")) if num.positive?
 return prompt(result)
end

signed_integer_to_string(-321)
signed_integer_to_string(4321)
signed_integer_to_string(0)

=begin
  
Approach:

This challenge is identical to the previous one, where we are tasked
with taking an integer and returning the string equivalent of said
integer with a major caveat, we have to be able to recognize 
negative numbers as well as positive numbers.

With this is mind, we will reuse all of our previous methods but we
will make one small change to our integer_to_string method.  Inside
this method, we will add a condition that converts our integer to
a positive number regardless of what it is originally.

This allows us to perform the operations inside the intger_to_string
method without worrying about the sign of the number.

Lastly, we will create a method called signed_integer_to_string,
in here we will check if the number is negative, positive or zero and
apply the proper sign based on the instructions.
  
=end
