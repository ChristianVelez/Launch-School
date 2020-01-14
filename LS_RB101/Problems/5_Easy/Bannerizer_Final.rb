=begin
  
Write a method that will take a short line of text, and print it within a box.

Example:

print_in_box('To boldly go where no one has gone before.')

+--------------------------------------------+
|                                            |
| To boldly go where no one has gone before. |
|                                            |
+--------------------------------------------+
  

print_in_box('')

+--+
|  |
|  |
|  |
+--+

Further Exploration:

For a real challenge, try word wrapping very long messages 
so they appear on multiple lines, but still within a box.

=end

INNER_EDGE = "+-"
OUTER_EDGE = "-+"
EDGE = "|"
DASH = "-"
SPACE = " "

# str = <<~HEREDOC
#            To boldly go where no one has gone 
#            before.To boldly go where no one has 
#            gone before.To boldly go where no one 
#            has gone before.To boldly go where 
#            no one has gone before.
#            HEREDOC

single_str = ' '

def format_string(str)
  str_array = []
    
    if str.strip.empty?
      space_qty = str.count(" ")
      str_array << (SPACE * space_qty)
    else
      str.split.each_slice(9) { |line| str_array << line.join(" ") }
    end 
  str_array
end 

def max_length(str)
  str_array  = format_string(str)
  str_array.max_by(&:length).size
end

def print_string(str)
  str_array  = format_string(str)
  max_length = max_length(str)

  str_array.map do |line|
    line_length = line.size
    difference  = max_length - line_length
    
    puts "| #{line}#{SPACE * difference} |"
  end
end

def top_and_bottom_art(str)
  max_length = max_length(str)
  puts "#{INNER_EDGE}#{DASH * max_length}#{OUTER_EDGE}"
end

def edge_art(str)
  max_length = max_length(str)
  adjusted_edge_length = max_length + 2
  puts "#{EDGE}#{SPACE * adjusted_edge_length}#{EDGE}"
end

def print_to_box(str)
  top_and_bottom_art(str)
  edge_art(str)
  print_string(str)
  edge_art(str)
  top_and_bottom_art(str)
end

print_to_box(single_str)

=begin
  
  Approach:  This solution takes into account the further exploration requirements.
  In order to allow for word wrapping, we have to consider how to break up a multi line
  string and also how we deal with empty strings, regardless of size.

  I settled on an arbitrary number of words per sentence and the way we achived this is
  by taking our input, and breaking up into an array of 9 word sentences.

  We begin by creating a method called format_string that takes our input string as an
  parameter.  Here, we start by creating an empty array called str_array where we will
  store our 9 word sentences or empty strings.  We create a conditional statement, if/else,
  where we first check if the string is empty or contains only white space.  We do this by
  using the strip method on the string, where a string will only be empty if it only contains
  white spaces or is empty from the start, if this is the case, we get a count for the number of 
  white space characters inside the original string and push that into our str_array.

  If the string is not empty or composed of only white spaces, we move on to our else condition 
  where we will then use the split and each_slice methods jointly to split our input into 
  individual sentences composed of a maximum of 9 words and store each sentence as a value of 
  our str_array.  The output of format_string method will be an array.

  We now create a method called max_length that will scan the array returned by the format_string
  method and find the largest (longest) value, which will help us determine how big our box will be.

  Next, we create a method called print_string that will print each individual string inside the box.  
  Here we will map over format_string array and take a measurement of the length of each individual 
  sentence and compare that the length of the longest sentence, this equation will return a number that 
  will be stored inside the difference variable.  This variable will allows to add the appropriate
  number of white spaces after each sentence so the edges of our box are even all the way around.

  We also create two separate methods that will print out the top, bottom and edgese of our box 
  and finally we call our top_and_bottom_art, edge_art and print_string methods inside our final
  print_in_box_method to accurately print out our string input inside the box.
=end

















