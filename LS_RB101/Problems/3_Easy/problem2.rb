# def get_info
#   puts "Enter the length of the room in meters: "
#   @length = gets.chomp.to_i
#   puts "Enter the width of the room in meters: "
#   @width = gets.chomp.to_i
# end

# def calculate_area(*args)
#   result = [@length, @width].reduce(:*).to_f
#   result_in_feet = (result * 10.7639).round(2) 
#   puts "The area of the room is #{result} square meters (#{result_in_feet} square feet)"
# end

# def print_result
#   get_info
#   calculate_area
# end

# print_result


# get_info = -> do
#   puts "Enter the length of the room in meters: "
#   length = gets.chomp.to_i
#   puts "Enter the width of the room in meters: "
#   width = gets.chomp.to_i

#   result = [length, width].reduce(:*).to_f
#   puts "This is your answer #{result}"
# end

# #result = -> { [length, width].reduce(:*).to_f }

# def print_result(&information)
#   information.call
# end

# print_result(&get_info)


def get_info
  puts "Enter the length of the room in feet: "
  @length = gets.chomp.to_i
  puts "Enter the width of the room in feet: "
  @width = gets.chomp.to_i
end

def calculate_area(*args)
  result = [@length, @width].reduce(:*).to_f
  result_in_square_inches = (result * 144).round(2)
  result_in_square_cms = (result * 929.03).round(2) 

  puts %(
      The area of the room is #{result} square feet.
      The area of the room is #{result_in_square_inches} square inches.
      The area of the room is #{result_in_square_cms} square centimeters.
    )
end

def print_result
  get_info
  calculate_area
end

print_result
