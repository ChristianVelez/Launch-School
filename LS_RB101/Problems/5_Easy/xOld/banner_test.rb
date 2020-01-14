INNER_EDGE = "+-"
OUTER_EDGE = "-+"
EDGE = "|"
DASH = "-"
SPACE = " "

#puts "#{str}"
#p str.size
#p str.split(" ")

#str.split(" ").each_slice(3) { |line| str_array << line.join }
#str.count

# if str.empty?
#   str_array = ['']
# elsif str.first(3) == " "
#   num_spaces = str.count(" ")
#   str_array = num_spaces * " "
# else
#   str.split(" ").each_slice(3) { |line| str_array << line.join }
# end

# str_array

# answer = str_array.map do |line|
#   puts "#{INNER_EDGE}#{DASH}#{OUTER_EDGE}"
#   puts "#{EDGE}#{SPACE}#{EDGE}"
#   puts "| #{line} |"
#   puts "#{EDGE}#{SPACE}#{EDGE}"
#   puts "#{INNER_EDGE}#{DASH}#{OUTER_EDGE}"
# end


#puts answer
# p str_array
#p str.split('')

str = <<~HEREDOC
           To boldly go where no one has gone before.To 
           boldly go where no one has gone before.To boldly 
           go where no one has gone before.To boldly go where 
           no one has gone before.
           HEREDOC



str_array = []

#str.split.each_slice(3) { |line| str_array << line.join(" ") }

#p str.split(" ")
# str.strip.empty?

# num = str.count(" ")

# puts "#{str}" + "!"

#puts "#{num * " "}"
if str.strip.empty?
  num = str.count(" ")
  p str_array = SPACE * str.count(" ")
else
  str.split.each_slice(9) { |line| str_array << line.join(" ") }
  p str_array
end 


#puts str.count(" ")
#puts SPACE * str.count(" ")




#p str_array

#str.split.each_slice(3) { |line| str_array << line.join.(" ") }

#str_array
#p test
#if test

# if str.count(" ") > 2
#   puts "You're right" 
# else
#   puts "fuck off"
# end




























