=begin
  
Write a method that returns an Array 
that contains every other element of 
an Array that is passed in as an argument. 
The values in the returned list should 
be those values that are in the 
1st, 3rd, 5th, and so on elements 
of the argument Array. In other words, even
indexed elements in the array.

Example:

oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
oddities(['abc', 'def']) == ['abc']
oddities([123]) == [123]
oddities([]) == []
  
=end

# version 1

def oddities(arr)
  arr_length = arr.size
  index  = 0
  odd_elements = []

  loop do
    odd_elements << arr[index] if index.even?

    index += 1
    break if index > arr_length
  end
  odd_elements.compact
end

# version 2

def oddities(arr)
  arr.reject.with_index{ |val, idx| idx.odd? }
end

# version 3

def oddities(arr)
  arr.select.with_index{ |val, idx| idx.even? }
end

# p oddities([2, 3, 4, 5, 6])
# p oddities([1, 2, 3, 4, 5, 6])
# p oddities(['abc', 'def'])
# p oddities([123])
# p oddities([])

=begin
  
Further Exploration:

Write a companion method that returns the 
2nd, 4th, 6th, and so on elements of an array.
In other words, odd indexed elements in the array.

Try to solve this exercise in at least 2 
additional ways.

  
=end

# Companion Method -- Opposite

# version 1 

def non_oddities(arr)
  arr_length = arr.size
  index  = 0
  even_elements = []

  loop do
    even_elements << arr[index] if index.odd?

    index += 1
    break if index > arr_length
  end
  even_elements.compact
end

# version 2

def non_oddities(arr)
  arr.reject.with_index{ |val, idx| idx.even? }
end

# version 3

def non_oddities(arr)
  arr.select.with_index{ |val, idx| idx.odd? }
end

p non_oddities([2, 3, 4, 5, 6])
p non_oddities([1, 2, 3, 4, 5, 6])
p non_oddities(['abc', 'def'])
p non_oddities([123])
p non_oddities([])



