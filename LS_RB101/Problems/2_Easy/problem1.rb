=begin
  
Write a method that takes two arguments, a string 
and a positive integer, and prints the string as 
many times as the integer indicates.
  
=end

# Version 1, using the Enumerable cycle method
def repeat(str, repetitions)
  # Here we use a comma to split a string in order to escape spaces between words
  # This allows us to make sure the entire input is kept together in case we use
  # more than one word
  new_str = str.split(",")

  # The cycle method uses our repetitions input, which is an integer, to output our
  # string as many times as is needed
  new_str.cycle(repetitions) { | words | puts words }
end

repeat("hello world", 4)

# Version 2 using a loop and counter
def repeat(str, repetitions)
  count = 1

  loop do 
    puts str
    
    break if count == repetitions
    count += 1
  end
end
repeat("hello world", 4)