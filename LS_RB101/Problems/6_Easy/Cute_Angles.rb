=begin
  
Write a method that takes a floating point number that represents 
an angle between 0 and 360 degrees and returns a String that 
represents that angle in degrees, minutes and seconds. You should 
use a degree symbol (°) to represent degrees, a single quote (') 
to represent minutes, and a double quote (") to represent seconds. 
A degree has 60 minutes, while a minute has 60 seconds.

Examples:

dms(30) == %(30°00'00")
dms(76.73) == %(76°43'48")
dms(254.6) == %(254°36'00")
dms(93.034773) == %(93°02'05")
dms(0) == %(0°00'00")
dms(360) == %(360°00'00") || dms(360) == %(0°00'00")
  
=end

DEGREE = "\xC2\xB0"
MINUTE = "'"
SECOND = '"'

def positive_float_num(float_num)
  if float_num.negative?
    until float_num.positive?
      float_num = float_num + 360
    end
  end
  float_num
end

def grab_degrees(float_num)
  float_num = float_num.to_i

  return float_num = 0 if float_num == 360 
  return float_num = float_num % 360 if float_num > 360
  return float_num = positive_float_num(float_num) if float_num.negative?
  return float_num
end

def dms(float_num)
  degrees = grab_degrees(float_num)
  minutes = (float_num % 1) * 60
  seconds = (minutes % 1) * 60

  puts format('%02d%s%02d%s%02d%s', degrees, DEGREE, minutes, MINUTE, seconds, SECOND)  
end

dms(-420)

=begin
  
  Approach:

  This problem set requires us to take a floating point input and convert it to
  a string that represents an angle in degrees, minutes and seconds.

  We will split the problem into two components.  First we will focus on how 
  we will convert the string input into integers that conform to the equation
  we will use to derive our result in degrees, minutes and seconds.

  An angle is composed of 360 degrees. An input of "350" would result in the
  following output:

  300°00'00"

  Where ° represents degrees, ' represents minutes & " represents seconds.

  One degree is composed of 60 minutes and One minute is composed of 60 seconds.

  With this in mind, we can format a formula where in order to obtain our 
  degrees, we will convert our float input into an integer.

  Ex:  dms(265.76)
       degrees = 265
  
  Next we will retrieve our minutes.  This is achieved like so:

       minutes = (input % 1) * 60

  Finally, we will retrieve our seconds.  This is achieved like so:

       seconds = (minutes % 1) * 60

  Now that we have split our input into degrees, minutes and seconds, we
  simply need to format it based on the instructions. And we can do that
  with the format method, which takes a number of arguments.

      puts format('%02d%s%02d%s%02d%s', integer, STRING, integer, STRING, integer, STRING)          
=end

# def grab_degrees(float_num)
#   float_num = float_num.to_i
#   if float_num == 360
#     float_num = 0
#   elsif float_num > 360
#     float_num = float_num % 360
#   elsif float_num.negative?
#     until float_num.positive?
#       float_num = float_num + 360
#     end
#   else
#     float_num
#   end
#   float_num
# end 


