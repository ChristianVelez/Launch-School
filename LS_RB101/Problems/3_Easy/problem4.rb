=begin
 
Build a program that displays when the user will 
retire and how many years she has to work till retirement.

Example: 

What is your age? 30
At what age would you like to retire? 70

It's 2016. You will retire in 2056.
You have only 40 years of work to go!

=end

def current_year
  Time.new.year
end

def you_wanna_retire?
  puts "What is your age?"
  age = gets.chomp.to_i
  puts "At what age would you like to retire?"
  retirement_age = (gets.chomp.to_i - age)

  puts %(It's #{current_year}. You will retire in #{current_year + retirement_age}" 
  You only have #{retirement_age} years of work to go!)
end

you_wanna_retire?