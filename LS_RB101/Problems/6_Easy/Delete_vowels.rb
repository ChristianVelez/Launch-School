=begin
  
Write a method that takes an array of strings, and 
returns an array of the same string values, except 
with the vowels (a, e, i, o, u) removed.

Example:

remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']

=end

VOWELS = ['a', 'e', 'i', 'o', 'u']

def remove_vowels(str_arr)
  letter_array = str_arr.to_s
  answer = []

  letter_array.chars.map { |char| !VOWELS.include?(char.downcase) ? answer << char : next} 

  answer.join('').to_s
end


#puts remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)

#p %w(green YELLOW black white)
#puts %w(bcdfghjklmnpqrstvwxyz) == ["bcdfghjklmnpqrstvwxyz"]
puts ["grn", "YLLW", "blck", "wht"] == %w(grn YLLW blck wht)
#puts VOWELS.include?('a')
#p VOWELS
# test = %w(abcdefghijklmnopqrstuvwxyz).to_s
# puts test.is_a?(String)
# new_test = test.gsub(/aeiou/, '')

# puts new_test



