=begin
  
  Write a method that combines two Arrays passed in as arguments, 
  and returns a new Array that contains all elements from both 
  Array arguments, with the elements taken in alternation.

  You may assume that both input Arrays are non-empty, and that 
  they have the same number of elements.

  Example:

  interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']

=end

test_array1 = [1, 2, 3]
test_array2 = ["a", "b", "c"]

# using a loop
def interleave(arr1, arr2)
  counter = 0
  result = []

  loop do
    break if counter == test_array1.size
    result << test_array1[counter] << test_array2[counter]
    counter += 1
  end
  p result
end

interleave(test_array1, test_array2)

# using a while loop
def interleave(arr1, arr2)
  counter = 0
  result = []
  
  while counter != test_array1.size do
    result << test_array1[counter] << test_array2[counter]
    counter += 1
  end

  p result
end

interleave(test_array1, test_array2)

# using an until loop
def interleave(arr1, arr2)
  counter = 0
  result

  until counter == test_array1.size
    result << test_array1[counter] << test_array2[counter]
    counter += 1
  end
  p result
end

interleave(test_array1, test_array2)

# using a Enumerable#map and Enumerable#with_index
def interleave(arr1, arr2)
  test_array1.map.with_index { |el, idx| result << el << test_array2[idx] }
end

interleave(test_array1, test_array2)

# Further Exploration
def interleave(arr1, arr2)
  test_array1.zip(test_array2).flatten
end