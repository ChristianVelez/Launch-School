=begin

After Midnight (Part 1)

The time of day can be represented as the number of minutes 
before or after midnight. If the number of minutes is positive, 
the time is after midnight. If the number of minutes is negative, 
the time is before midnight.

Write a method that takes a time using this minute-based format 
and returns the time of day in 24 hour format (hh:mm). 
Your method should work with any integer input.

You may not use ruby's Date and Time classes.

Examples:

time_of_day(0) == "00:00"
time_of_day(-3) == "23:57"
time_of_day(35) == "00:35"
time_of_day(-1437) == "00:03"
time_of_day(3000) == "02:00"
time_of_day(800) == "13:20"
time_of_day(-4231) == "01:29"
Disregard Daylight Savings and Standard Time and other complications.

Further Exploration

How would you approach this problem if you were allowed to use 
ruby's Date and Time classes? Suppose you also needed to consider 
the day of week? (Assume that delta_minutes is the number of minutes 
before or after midnight between Saturday and Sunday; in such a method, 
a delta_minutes value of -4231 would need to produce a return value of Thursday 01:29.)

=end

def time_of_day(input)
  hours = (input % 1440) / 60
  minutes = input % 60
  
  puts format('%0.2d:%0.2d', hours, minutes)
end

time_of_day(35)

# Further Exploration

require 'date'
require 'time'

def format_mins(mins)
  mins.negative? ? mins + 10080 : mins
end

def format_day(mins)
  Date::DAYNAMES[mins / 1440]
end

def time_of_the_day(minutes)
  delta_minutes = format_mins(minutes)
  delta_seconds = delta_minutes * 60
  
  day = format_day(delta_minutes)
  hours_and_minutes = Time.at(delta_seconds)
  
  hours_and_minutes.strftime "#{day} %H:%M"
end

time_of_the_day(-4231)
