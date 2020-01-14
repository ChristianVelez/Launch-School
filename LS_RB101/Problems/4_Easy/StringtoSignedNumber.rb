=begin
  
In the previous exercise, you developed a method that converts 
simple numeric strings to Integers. In this exercise, you're 
going to extend that method to work with signed numbers.

Write a method that takes a String of digits, and returns the 
appropriate number as an integer. The String may have a 
leading + or - sign; if the first character is a +, your method 
should return a positive number; if it is a -, your method should 
return a negative number. If no sign is given, you should return 
a positive number.

You may assume the string will always contain a valid number.

You may not use any of the standard conversion methods available 
in Ruby, such as String#to_i, Integer(), etc. You may, however, 
use the string_to_integer method from the previous lesson.

Examples

string_to_signed_integer('4321') == 4321
string_to_signed_integer('-570') == -570
string_to_signed_integer('+100') == 100
  
=end

INTEGERS =  { '0' => 0, '1' => 1, '2' => 2,
              '3' => 3, '4' => 4, '5' => 5,
              '6' => 6, '7' => 7, '8' => 8,
              '9' => 9  }

def string_to_integer(str)
  str = str.delete('^0-9')
  num_array = str.chars.map { |num| INTEGERS[num] }
  
  result = num_array.inject(0) { |sum, num| ( sum * 10 ) + num }
end

def string_to_signed_integer(str)
  input = string_to_integer(str)
  result = str.include?("-") ? input * -1 : input 
  
  puts result
end

string_to_signed_integer('+100')




