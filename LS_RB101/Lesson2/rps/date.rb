require 'time'
require 'date'



# time_of_day(45)

# puts Date::DAYNAMES + 1

# d = Date.new
# d = d.cwday

#START_OF_THE_WEEK = Date.new(2019, 7, 8)

# WEEK = { 0 => "Monday", 1 => "Tuesday",
#          2 => "Wednesday", 3 => "Thursday",
#          4 => "Friday", 5 => "Saturday",
#          6 => "Sunday"}

WEEK = Date::DAYNAMES

# def grab_day_of_week
#   START_OF_THE_WEEK.cwday
# end

def time_of_day(mins)
  hours   = mins % 1440 / 60
  minutes = mins % 60
  #seconds = minutes * 60
  day = (mins / 60) / 24
  day_of_week = WEEK.fetch(day)

  time = "#{day_of_week}" + " " + "#{format( '%0.2d:%0.2d', hours, minutes)}"
  #time =  START_OF_THE_WEEK.strftime(%A,%H:%M)
end

puts time_of_day(-4231)

# test = monday.cwday + 1

# puts test == 2