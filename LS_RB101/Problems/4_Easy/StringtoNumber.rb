=begin
  
Write a method that takes a String of digits, 
and returns the appropriate number as an integer. 

You may not use any of the standard conversion methods 
available in Ruby, such as String#to_i, Integer(), etc. 
Your method should do this the old-fashioned way and 
calculate the result by analyzing the characters in the string.

Examples:

string_to_integer('4321') == 4321
string_to_integer('570') == 570
  
=end

INTEGERS =  { '0' => 0, '1' => 1, '2' => 2,
              '3' => 3, '4' => 4, '5' => 5,
              '6' => 6, '7' => 7, '8' => 8,
              '9' => 9  }


def string_to_integer(str)
  result = str.chars.map { |num| INTEGERS.fetch(num) }
  p result.inject(0) { |accumulator, num| accumulator * 10 + num }
end

puts string_to_integer('4321') == 4321
puts string_to_integer('570') == 570

=begin

  Approach:

  We are tasked with converting a string version of an integer
  to the integer equivalent.  For example:

  string_to_integer('4321') == 4321

  Process:

  - Input = string
  - Output = integer

  - Create constant called INTEGERS that contains a hash
    with key value pairs that represent digits 0-9 with
    the string version as the key and the integer version
    as the value.
  - Create a method called string_to_integer(str) that takes a
    string as its input.
  - Convert str to array of string characters
  - Iterate over the array with Array#map method and grab
    matching value from INTEGER constant. Example:
    '0' => 0  
  -  Arraty#map method will return a new array with the 
    integer version of the input
  - The above array is saved into a variable called result
  - Using Array#inject, we set a start value of 0 and we iterate
    over our result array and multiply each number times 10 and add
    each consecutive number  through each iteration.  Example:
    
    431
    10 * 0 + 4 -> 4
    10 * 4 + 3 -> 43
    10 * 43 + 1 -> 431

  - Once iteretion is done, we get our result.  
=end

# Further Exploration
  
=begin
  
Write a hexadecimal_to_integer method that converts a string 
representing a hexadecimal number to its integer value.

Example:

hexadecimal_to_integer('4D9f') == 19871
  
=end

INTEGERS = { '0' => 0,  '1' => 1,  '2' => 2,
             '3' => 3,  '4' => 4,  '5' => 5,
             '6' => 6,  '7' => 7,  '8' => 8,
             '9' => 9,  'a' => 10, 'b' => 11,
             'c' => 12, 'd' => 13, 'e' => 14,
             'f' => 15}

def hexadecimal_to_integer(str)
  str_array = str.downcase.chars
  num_array = str_array.map {|num| INTEGERS[num]}.reverse
  
  result = num_array.map.with_index do |num, idx|
    num * (16**idx)
  end.reduce(:+)
end

p hexadecimal_to_integer('4D9f')
p hexadecimal_to_integer("1D9")
p hexadecimal_to_integer("80E1")
p hexadecimal_to_integer("10CE")

#Optional answer

def hexadecimal_to_integer(str)
  hexa = str.to_i(16) # Integer#to_i method with a base num of 16 works the same as below with hex method
  hexa
end

hexadecimal_to_integer('4D9f') == 19871

# or

def hexadecimal_to_integer(str)
  hexa = str.hex #built in Ruby method to convert strings to hexadecimal numbers
  hexa
end


=begin
  We are tasked with converting hexadecimal numbers to their
  integer equivalent.  First we must figure out what hexadecimal
  numbers are and how we can convert them to integers.

  Hexadecimal numbers run from 0-9 where 0 hex is equal to 0 decimal, 
  1 is equal to 1, and so on.  Once we reach the number 9
  in hex, we then pick up on letters where a is equaly to 10, 
  b is equal to 11, and so on until we reach 15, which is the letter f.

  Knowing this, we can create a hash lookup table, similar to the
  one we created for the last challenge but in this case we will map
  strings '0' to '9' and 'a' through 'f' as keys and the numbers
  0 through 15 as the matching values.

  We now will create a method called hexadecimal_to_integer that will 
  take our string input, split into individual characters, apply the 
  String#downcase method and save them as an array into a variable 
  called str_array.  We will then map over the str_array and grab the 
  matching integer values from our hash lookup table and save the values 
  to an array called num_array and reverse the order of the array values.  
  This is done so we can use the index of each value as the power 
  multiplier in order to convert these hex values to integers.

  We multiply every digit with 16 power of digit location.
  (zero based, 7DE: E location is 0, D location is 1 and the 7 location is 2)

  Here is an example:

  7DE is a hex number
  7DE = (7 * 162) + (13 * 161) + (14 * 160) 
  7DE = (7 * 256) + (13 * 16) + (14 * 1) 
  7DE = 1792 + 208 + 14 
  7DE = 2014 (in decimal number)

  Since the order of the integer values in our num_array doesn't really matter, 
  reversing the order allows to use the index as the power multiplier.  Like so:
  
  num * (16**idx)

  Finally, we will add up all the multipliers and get our result.

  Process:

  - Input: string
  - Output: integer

  - SET INTEGERS = {..holds key value pairs for lookup table "0"-"9""a"-"z" match 0-15}
  - SET hexadecimal_to_integer(str) takes string input
    - SET str_array = string input, lowercase, and split into individual characters
    - SET num_array = use Array#map method to grab matching values from INTEGERS lookup      
      table, attach Array#reverse to reverse order of values in num_array 
    - SET result = use Array#map and Enumerable#with_index to iterate over num_array
      to perform base operation, num * (16**idx).  Attach Array#reduce at the end to sum
      all values into our final result
=end