=begin 

Modify the word_sizes method from the previous exercise to exclude non-letters when determining word size. For instance, the length of "it's" is 3, not 4.

Examples

word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
word_sizes('') == {}

=end

def remove_non_chars(str)
  str.split.map { |word| word.scan(/[a-zA-Z]/).join }.join(" ")
end

def word_sizes(str)
  remove_non_chars(str).split.group_by { |word| word.length }
                             .transform_values { |val| val.length }.sort.to_h
end

#word_sizes('Four score and seven.')
#word_sizes("Hey diddle diddle, the cat and the fiddle!")
#word_sizes("What's up doc?")

=begin

  -Take string input and split into an array of words separated by spaces
  -Take array and iterate through each word and remove all non alphabet characters
  -This operation goes into the remove_non_chars method which will return
  an array
  -Take array from remove_non_chars method and pass it as an argument into the word_sizes method
  -word_sizes method will take the input array and convert it to a hash via
  the group_by method, which will group the values of the array based on the
  length of every word in the array
  -We then use the transform_values enumerable method to convert values in the hash from string values into integers (from the original input)
  -Finally we sort it and convert it back into a hash
=end