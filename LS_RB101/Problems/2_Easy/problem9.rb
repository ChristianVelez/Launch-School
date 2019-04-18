=begin
Write a method that takes one argument, an array 
containing integers, and returns the average 
of all numbers in the array. The array will never 
be empty and the numbers will always be positive integers.

Examples:

puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40

=end

def average(arr)
  num_one = arr.reduce(:+)
  num_two = arr.length

  p result = (num_one / num_two).to_f
end

puts average([1, 5, 87, 45, 8, 8]) == 25