=begin

Write a method that takes a string with one or more 
space separated words and returns a hash that shows 
the number of words of different sizes.

Words consist of any string of characters that do not 
include a space.

Examples:

word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
word_sizes('') == {}

=end

# str = 'Four four two a three four'
# str_arr = str.split

# result = str_arr.group_by { |word| word.length }
#                 .transform_values { |val| val.length }.sort.to_h

# Method only works with Ruby 2.4 and above

def word_sizes(str)
  split_strings = str.split
  word_count = split_strings.group_by { |word| word.length }          
  result = word_count.transform_values { |val| val.length }
end

# word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
# word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
# word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
# word_sizes('') == {}

=begin
  Approach:

  - Take a string and split into an array of words separated by spaces
  - Take array and group it by word length.  This will produce a hash
    that has keys as word length (integer) and values as an array that
    contains all the occurences that have matching word length
  - Take values in hash and transform them into an integer that counts
    the number of words that have the same word length.  This will 
    produce an unsorted hash.
  - Take hash and sort it.  This will produce a sorted array of arrays
    containing the number of occurrences and word lengths.
  _ Take array and convert it to a hash

  Alternative Approach

  str = 'Four score and seven.'
  str_arr = str.split.map { |val| val.length }.sort
  str_arr.each_with_object(Hash.new(0)) { |val, hash| hash[val] =+ 1}

  - Take string and convert to array of space separated words, convert 
    values in array to integers representing word length and
    sort numerically
  - Iterate over array with #each_with_object method, 
    set memo (return object) to a Hash that is initialized with a value of 0,
    then through iteration we set the key to the number of instances
    that have matching word length while the value is word length
=end