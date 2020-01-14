=begin
  
  Write a method that takes a positive integer, n, as an argument, 
  and displays a right triangle whose sides each have n stars. 
  The hypotenuse of the triangle (the diagonal side in the images below) 
  should have one end at the lower-left of the triangle, 
  and the other end at the upper-right.

  Examples:

  triangle(5)

      *
     **
    ***
   ****
  *****


  Input  = integer
  Output = string (space and star characters)
  
=end

input = 8

def triangle(input)
  space_count = (input - 1)
  star_count  = (input - space_count)

  # space_count goes down, star_count goes up, break loop when star_count == input

  loop do 
    print_space = "#{ ' ' * space_count }"
    print_star  = "#{ '*' * star_count }"

    puts print_space + print_star
    #puts print_star + print_space
    
    break if star_count == input 
    space_count -= 1
    star_count  += 1 
  end
end

triangle(input)

# def triangle(input)
#   star_count  = input
#   space_count = 0

#   # space_count goes up, star_count goes down, break loop when star_count == input

#   loop do 
#     break if space_count == input

#     print_space = "#{ ' ' * space_count }"
#     print_star  = "#{ '*' * star_count }"

#     #puts print_space + print_star
#     puts print_star + print_space

#     space_count += 1
#     star_count  -= 1 
#   end
# end

# triangle(input)