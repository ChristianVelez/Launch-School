=begin

Write a method that searches for all multiples of 3 or 5 
that lie between 1 and some other number, and then computes 
the sum of those multiples. For instance, if the supplied 
number is 20, the result should be 98 (3 + 5 + 6 + 9 + 10 + 12 + 15 + 18 + 20).

You may assume that the number passed in is an integer greater than 1.

Examples

multisum(3) == 3
multisum(5) == 8
multisum(10) == 33
multisum(1000) == 234168

=end

def multisum(num)
  numbers = (1..num).to_a
  puts multiples = numbers.select { |num| (num % 3 == 0 || num % 5 == 0) }.reduce(:+)
end

multisum(3) == 3
multisum(5) == 8
multisum(10) == 33
multisum(1000) == 234168

=begin
  
  Approach:

  We are tasked taking a number that will be the end point of a range,
  where we will create an array of consecutive numbers, 1 to num, from 
  which we will select only the numbers that are multiples of 3 and 5 
  and finally add those numbers up to get our answer.

  Input - Integer
  Output - Integer

  Process:

  - Create method called multisum(num) that takes an integer as input
  - Inside this method, creat a variable called numbers which will store
    a range, starting at 1 and ending at num. We then conver this range to
    an array
  - Create variable named multiples where we will traverse our array using
    the Array#select method to only select numbers that match our criteria,
    being multiples of 3 and 5, and finally, we apply the reduce method to
    add up all these numbers into a single integer.

  Notes:

  - The Array#select method returns an array and this allows us to attach the
    Array#reduce method at the end to perform the last operation, adding up
    all the numbers.  This is referred to as method chaining.
  - Newer versions of Ruby allow for the use of the Array#sum method, which
    does the same thing as Array#reduce but is more legible.
  
=end