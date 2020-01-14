=begin
A continuation of the previous exercise.

The British Empire adopted the Gregorian Calendar in 1752, 
which was a leap year. Prior to 1752, the Julian Calendar was used. 
Under the Julian Calendar, leap years occur in any year that is 
evenly divisible by 4.

Using this information, update the method from the previous 
exercise to determine leap years both before and after 1752.

leap_year?(2016) == true
leap_year?(2015) == false
leap_year?(2100) == false
leap_year?(2400) == true
leap_year?(240000) == true
leap_year?(240001) == false
leap_year?(2000) == true
leap_year?(1900) == false
leap_year?(1752) == true
leap_year?(1700) == true
leap_year?(1) == false
leap_year?(100) == true
leap_year?(400) == true

=end

def leap_year?(year)
  div_by_4   = (year % 4 == 0)
  div_by_100 = (year % 100 == 0)
  div_by_400 = (year % 400 == 0)
  
  condition1 = div_by_4 && !div_by_100
  condition2 = (div_by_4 && div_by_100) && div_by_400
  condition3 = div_by_4 if (year < 1752)

  return true if condition1
  return true if condition2
  return true if condition3
  return false
end

leap_year?(100)