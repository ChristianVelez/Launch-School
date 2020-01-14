=begin
  
  Write a method that takes a year as input and returns the century. 
  
  The return value should be a string that begins with the century 
  number, and ends with st, nd, rd, or th as appropriate for that number.

  New centuries begin in years that end with 01. So, the years 1901-2000 
  comprise the 20th century.
  
  Examples:

  century(2000) == '20th'
  century(2001) == '21st'
  century(1965) == '20th'
  century(256) == '3rd'
  century(5) == '1st'
  century(10103) == '102nd'
  century(1052) == '11th'
  century(1127) == '12th'
  century(11201) == '113th'
=end

ORD_EXCEPTIONS = [11, 12, 13]

def prompt(century, ord)
  puts "#{century}#{ord}"
end

def format_century(year) 
  year = year.to_i
  siglo = year / 100 + 1
  mult_of_100 = (year % 100 == 0)
  
  mult_of_100 ? siglo - 1 : siglo
end

def century(year)
  century    = format_century(year)
  condition  = century % 10
  exception  = century % 100
  
  return prompt(century, "th") if ORD_EXCEPTIONS.include?(exception)
  return prompt(century, "st") if condition == 1
  return prompt(century, "nd") if condition == 2
  return prompt(century, "rd") if condition == 3
  return prompt(century, "th")
end

century(2000)
century(2001)
century(1965)
century(256)
century(5)
century(10103)
century(1052)
century(1127)
century(11201)

