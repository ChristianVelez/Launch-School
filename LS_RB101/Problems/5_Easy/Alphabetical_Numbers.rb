=begin

Write a method that takes an Array of Integers between 0 and 19, and returns an Array of those Integers sorted based on the English words for each number:

zero, one, two, three, four, five, six, seven, eight, nine, ten, eleven, twelve, thirteen, fourteen, fifteen, sixteen, seventeen, eighteen, nineteen

Examples:

alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]

=end

LETTER_DIC = %w(zero one two three
                four five six seven
                eight nine ten eleven
                tweleve thirteen fourteen
                fifteen sixteen seventeen
                eighteen nineteen)

def alphabetic_number_sort(num_arr)
  dictionary = LETTER_DIC.zip(num_arr).to_h
  sorted_hash = dictionary.sort_by {|k, v| k}.to_h.values
end

alphabetic_number_sort((0..19).to_a)

=begin

Approach:

  -Create a constant that contains the string representation of numbers 0 through 19.
  -The alphabetic_number_sort method takes an array as its
  argument
  -Inside the alphabetic_number_sort method, we create a variable called dictionary where we combine the input array with our constant using the zip method which will result in a hash where the key and value pairs will 
  be 0 => 'zero', 1 => "one", etc
  -We then will sort our dictionary hash in numerical order, or by key, which will return a an array of arrays so it will have to be converted back to a hash and finally we simply grab the values, which are the integers, through the values hash method, which will return an array with the output we need

=end

#Further Exploration -- Using the sort method

LETTER_DIC = %w(zero one two three
                four five six seven
                eight nine ten eleven
                tweleve thirteen fourteen
                fifteen sixteen seventeen
                eighteen nineteen)

def alphabetic_number_sort(num_arr)
  num_arr.replace(LETTER_DIC).sort
end

alphabetic_number_sort((0..19).to_a)

=begin

  -Create a constant named LETTER_DIC that holds an array with a string representation of a range of integers
  from 0 to 19, sorted in that order
  -Create a method named alphabetic_number_sort that
  takes an array of integers from 0 to 19 as an argument
  -We take our integer array that has been passed into our
  method and use the replace method on it by passing the LETTER_DIC constant as an argument, essentially replacing our integer array with the LETTER_DIC array, which can then be sorted in order to obtain the exact
  result we are looking for.
=end