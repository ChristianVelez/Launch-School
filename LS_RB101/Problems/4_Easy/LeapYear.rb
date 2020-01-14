=begin
  
In the modern era under the Gregorian Calendar, 
leap years occur in every year that is evenly 
divisible by 4, unless the year is also divisible by 100. 
If the year is evenly divisible by 100, then it is not a 
leap year unless the year is evenly divisible by 400.

Assume this rule is good for any year greater than year 0. 

Write a method that takes any year greater than 0 as input, 
and returns true if the year is a leap year, or false if it 
is not a leap year.

Examples:

leap_year?(2016) == true
leap_year?(2015) == false
leap_year?(2100) == false
leap_year?(2400) == true
leap_year?(240000) == true
leap_year?(240001) == false
leap_year?(2000) == true
leap_year?(1900) == false
leap_year?(1752) == true
leap_year?(1700) == false
leap_year?(1) == false
leap_year?(100) == false
leap_year?(400) == true

=end

def leap_year?(num)
  div_by_4   = (num % 4 == 0)
  div_by_100 = (num % 100 == 0)
  div_by_400 = (num % 400 == 0)
  
  condition1 = div_by_4 && !div_by_100
  condition2 = (div_by_4 && div_by_100) && div_by_400
  
  return true if condition1
  return true if condition2
  return false
end

leap_year?(2016)
leap_year?(2015)
leap_year?(2100)
leap_year?(2400)
leap_year?(240000)
leap_year?(240001)
leap_year?(2000)
leap_year?(1900)
leap_year?(1752)
leap_year?(1700)
leap_year?(1)
leap_year?(100) 
leap_year?(400)

=begin
  Approach:

  There are only two possible conditions that would yield a leap year.
  
  First, the given year is evenly divisible by 4 and NOT evenly divisible by 100.
  Second, the given year is evenly divisible by 4, 100 and 400.

  Anything else is not considered a leap year.

  We start by creating three variables; 
  
  div_by_4
  div_by_100
  div_by_400

  These three variables will contain boolean conditions that will allow
  us to form the main logic of this program.

  We now create two other variables;

  condition1
  condition2

  Here we will store the logic that was explained above....what consititutes
  a leap year. condition1 will contain the logic of:
  
  condition1 = div_by_4 && !div_by_100 
  
  while condition2 will contain the logic of:

  condition2 = (div_by_4 && div_by_100) && div_by_400

  Finally, we return true if either of these conditions are properly
  executed, if not we return false.
=end
