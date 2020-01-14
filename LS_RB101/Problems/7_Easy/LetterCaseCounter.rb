=begin
  
Lettercase Counter
Write a method that takes a string, and then returns a hash 
that contains 3 entries: one represents the number of characters 
in the string that are lowercase letters, one the number of 
characters that are uppercase letters, and one the number of 
characters that are neither.

Examples

letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }

=end

lowercase_chars  = ("a".."z").to_a
uppercase_chars  = ("A".."Z").to_a

test_string = "1234"
test_input  = test_string.chars


answer_hash = {lowercase: 0 , uppercase: 0, neither: 0}

test_input.map do |char|
  if lowercase_chars.include?(char) 
    answer_hash[:lowercase] += 1
  elsif uppercase_chars.include?(char)
    answer_hash[:uppercase] += 1
  else
    answer_hash[:neither]   += 1
  end
end

p answer_hash