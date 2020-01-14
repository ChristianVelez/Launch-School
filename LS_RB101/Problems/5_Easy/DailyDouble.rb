=begin

Write a method that takes a string argument and returns a new string that contains the value of the original string with all consecutive duplicate characters collapsed into a single character. You may not use String#squeeze or String#squeeze!.

Examples:

crunch('ddaaiillyy ddoouubbllee') == 'daily double'
crunch('4444abcabccba') == '4abcabcba'
crunch('ggggggggggggggg') == 'g'
crunch('a') == 'a'
crunch('') == ''

=end

def crunch(str)
  word_array = str.split(' ')

  remove_doubles = word_array.map do |word|
    new_word = []
    word.chars.map do |letter|
      new_word.include?(letter) ? next : new_word << letter  
    end
    new_word.join
  end

  remove_doubles.join(' ')
end

crunch('ddaaiillyy ddoouubbllee')
crunch('4444abcabccba')
crunch('ggggggggggggggg')
crunch('a')
crunch('')

=begin
  Approach:

  -crunch method takes a string argument
  -inside cruch method, we split the string into an array of string values, separated by a space, and saved into a variable called
  word_array
  -we now iterate through the word_array and split each word into individual characters where we will check if a character exists more than once, if it does, we skip the iteration and move on to the next character.  A character is added to the new_word array if it is the first instance of that character.
  -Once the duplicated characters are removed the new_word string values
  are joined via the String#join method
  -The result of these iterations is an array containing however many
  string elements with the duplicates removed.  These iterations were saved into a variable called remove_doubles
  -finally, we take our remove_doubles array and use the String#join method to merge all the string values into a single string
=end