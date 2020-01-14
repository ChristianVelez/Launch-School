INNER_EDGE = "+-"
OUTER_EDGE = "-+"
EDGE = "|"

def split_str(str)
  mod_str = str.split
  new_mod_str_arr = []
  mod_str.each_slice(8) { |sub_array| new_mod_str_arr << sub_array.join(" ") }
  new_mod_str_arr
end

def dash_or_space(str, num)
  str.center(num, str)
end

def perimeter(dash, num)
  if num < 1
   puts "#{INNER_EDGE}#{OUTER_EDGE}"
  else
   puts "#{INNER_EDGE}#{dash}#{OUTER_EDGE}"
  end
end

def edge(space)
  puts "#{EDGE} #{space} #{EDGE}"
end

def print_type(str_array)
  split_str(str_array).map { |line| edge(line) }
end

def print_in_box(str) 
  length = split_str(str).first.size
  #new_str = truncate(str)
  adjusted_length = length + 2
  other = length - 2
  centered_str = str.center(adjusted_length)

  top_line    = perimeter(dash_or_space("-", length), length) 
  first_line  = edge(dash_or_space(" ", length))
  center_line = print_type(centered_str)#edge(centered_str)
  second_line = edge(dash_or_space(" ", length))
  bottom_line = perimeter(dash_or_space("-", length), length) 
end

input = <<~HEREDOC
           To boldly go where no one has gone before.To 
           boldly go where no one has gone before.To boldly 
           go where no one has gone before.To boldly go where 
           no one has gone before.
           HEREDOC

print_in_box(input)
puts input.size

p split_str(input)
print
# str = "This is the first string This is the second string."

# p split_str(str)
