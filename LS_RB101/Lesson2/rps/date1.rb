require 'time'
require 'date'

# def display_time(day, hrs, mins)
#   "#{day}" + " " + "#{format( '%0.2d:%0.2d', hrs, mins)}"
# end

# def time_of_day(mins)
#   hours   = mins % 1440 / 60
#   minutes = mins % 60
#   day     = (mins / 60) / 24
#   week    = Date::DAYNAMES
#   day_of_week = week.fetch(day)

#   result = display_time(day_of_week, hours, minutes)
# end

# puts time_of_day(-3)

day = 11
month = 4
year = 2015 

#today = Date.strptime('#{year}', '#{month}', '#{day}', '%Y-%m-%d' )

today = Date.new(year, month, day)
puts today