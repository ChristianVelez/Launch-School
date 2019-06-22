=begin
  
  Instructions:

  Write a program that asks the user to enter an integer
  greater than 0, then asks if the wants to determine the
  sum or product of all numbers between 1 and the entered  
  integer.

  Examples:

  >> Please enter an integer greater than 0:
  5
  >> Enter "s" to compute the sum, 'p' to compute the product
  s
  The sum of the integers between 1 and 5 is 15
  
  ----

  >> Please enter an integer greater than 0:
  6
  >> Enter "s" to compute the sum, 'p' to compute the product
  p
  The sum of the integers between 1 and 6 is 720

______

  Problem:

  - ask user for an integer
  - integer must be positive (greater than 0)
  - if number is negative, prompt user for a positive integer
  - create a range from 1 to given number (ex: (1..num) )
  - create array of numbers from range ( ex: [1, 2, 3, 4, 5] )
  - if user enters 's', return the sum of all integers in array ( ex: [1,2,3].reduce(:+) )
  - if user enters 'p', return product of all integers in array ( ex: [1,2,3].reduce(:+) )
  - return a string that outputs the result based on previous choice

______
  
  Algorithm:

  - Create methods using single responsbility pattern
  - One method to compute the sum, One to compute the product
  - Use loop to prompt user for a positive integer
  - Display answer with a string based on user's choice
=end

def sum
  @num_array.reduce(:+)
end

def product
  @num_array.reduce(:*)
end

def get_info
  loop do 
    puts   ">> Please enter an integer greater than 0:"
    @answer = gets.chomp.to_i

    if @answer < 1
      puts ">> Please enter only a positive number"
    else
      @num_range = (1..@answer)
      @num_array = @num_range.to_a
    end
    break if @answer > 0
  end

  @num_array

  puts ">> Enter 's' to compute the sum, 'p' to compute the product"
  @sum_or_product = gets.chomp.downcase

  if @sum_or_product == "s" 
    puts "The sum of 1 to #{@answer} is #{sum}" 
  else 
    puts "The product of 1 to #{@answer} is #{product}" 
  end
end

def display_answer
  get_info
end

display_answer







