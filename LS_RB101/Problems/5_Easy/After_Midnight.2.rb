=begin
  
As seen in the previous exercise, the time of day can be 
represented as the number of minutes before or after midnight. 
If the number of minutes is positive, the time is after 
midnight. If the number of minutes is negative, the time is 
before midnight.

Write two methods that each take a time of day in 24 hour 
format, and return the number of minutes before and after 
midnight, respectively. Both methods should return a value 
in the range 0..1439.

You may not use ruby's Date and Time methods.

Examples:

after_midnight('00:00') == 0
before_midnight('00:00') == 0
after_midnight('12:34') == 754
before_midnight('12:34') == 686
after_midnight('24:00') == 0
before_midnight('24:00') == 0

Further Exploration

How would these methods change if you were allowed to use the Date and Time classes?

=end

def string_to_int(str)
  str.split(":").map(&:to_i)
end

def zero_or_24_hours?(hours_and_minutes)
  hours_and_minutes == 1440 || hours_and_minutes == 0
end

def before_midnight(str)
  hours, minutes = string_to_int(str)
  hours_and_minutes = (hours * 60) + minutes
  result = zero_or_24_hours?(hours_and_minutes) ? 0 : (1440 - hours_and_minutes)
end

def after_midnight(str)
  hours, minutes = string_to_int(str)
  hours_and_minutes = (hours * 60) + minutes
  result = zero_or_24_hours?(hours_and_minutes) ? 0 : hours_and_minutes
end

puts after_midnight('00:00') == 0
puts before_midnight('00:00') == 0
puts after_midnight('12:34') == 754
puts before_midnight('12:34') == 686
puts after_midnight('24:00') == 0
puts before_midnight("24:00") == 0

# Further Exploration

require "time"

def before_midnight(str)
  hours_and_minutes = Time.parse(str)
  hours = hours_and_minutes.hour
  minutes = hours_and_minutes.min

  result = 1440 - (hours * 60 + minutes) 
  result == 1440 ? 0 : result
end

def after_midnight(str)
  hours_and_minutes = Time.parse(str)
  hours = hours_and_minutes.hour
  minutes = hours_and_minutes.min

  result = (hours * 60) + minutes
end

puts after_midnight('00:00') == 0
puts before_midnight('00:00') == 0
puts after_midnight('12:34') == 754
puts before_midnight('12:34') == 686
puts after_midnight('24:00') == 0
puts before_midnight("24:00") == 0
