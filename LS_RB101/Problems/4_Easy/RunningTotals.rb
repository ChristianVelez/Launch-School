=begin

Write a method that takes an Array of numbers, 
and returns an Array with the same number of elements, a
nd each element has the running total from the original Array.

Examples:

running_total([2, 5, 13]) == [2, 7, 20]
running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
running_total([3]) == [3]
running_total([]) == []

=end

# def running_total(num_array)
#   run_total = 0
#   p num_array.map { |current_num| run_total += current_num }
# end

# running_total([2, 5, 13])

=begin
  
 Approach:

 We are tasked with taking an array of integers and returning an array
 that contains the running total of adding up all the numbers in the 
 array.

 For example:

 running_total([2,5,13])

 Would return:

 [2, 7, 20]

 Note that the array we return would contain the same number of 
 elements as the original input and only the first value would
 be the same in both arrays since that is the starting point
 for the operation.

 Process:

 - Input: array
 - Output: array
  
 - We create a method called running_total(array) which takes an
   array as input
 - Inside our method, we create a variable called run_total and
   set it to 0.  This will keep track of all our additions as
   we traverse our array.
 - We use the Array#map method to walk through the array where
   we add the current number to our run_total variable and 
   update at the end of each iteration.
 - The result of the operation is added to an array which is
   our answer.  Note that the Array#map method returns an
   array.
=end

# Further exploration with Array#injuect and Enumerable#each_with_object

# def running_total(num_array)
#   run_total = 0
#   p num_array.each_with_object([]) { |current_num, result| result << run_total += current_num }
# end

#running_total([2, 5, 13])

def running_total(num_array)
  run_total = 0
  p num_array.inject([]) { |result, current_num| result << run_total += current_num }
end

running_total([2, 5, 13])

=begin
  
  Notes:

  Enumerable#each_with_object takes an object parameter, in our case an empty array, where
  we will store the result of each iteration, meaning the result of the block execution.
  The block takes uses two parameters, result and current_num.  result is the named empty
  array and current_num refers to the current number in the iteration of the array.

  Array#inject is similar in the sense that it also takes an empty object as its parameter
  and requires two parameters inside the block.  The order of these parameters is reversed,
  however.

  Biggest difference between these two methods is that the Enumerable#each_with_object method
  ignores the return value from the block and simply passes the updated value to the next 
  iteration, in our case the updated run_total value and this allows the block to keep its
  state through all the iterations.
=end

#run_total([2, 5, 13])