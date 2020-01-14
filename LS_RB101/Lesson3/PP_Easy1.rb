# Question 1:

# What would you expect the code below to print out?

  # numbers = [1, 2, 2, 3]
  # numbers.uniq

  # puts numbers

  # => 1
  # => 2
  # => 3
  # => 4

=begin
  
  Answer:

  numbers.uniq returned a new array with duplicate values removed but
  it does not modify the original object on which it is called on.
  
  In this case though, the puts call at the end automatically calls
  to_s on all the arguments on the array, which is why they are 
  displayed one at a time.

  Note that puts and p will format the output differently.

  puts calls .to_s while p calls #inspect and adds a new line character
=end


=begin
  
  # Question 2

  Describe the difference between ! and ? in Ruby. And explain what would 
  happen in the following scenarios:

  1. what is != and where should you use it?
  2. put ! before something, like !user_name
  3. put ! after something, like words.uniq!
  4. put ? before something
  5. put ? after something
  6. put !! before something, like !!user_name

  Answer:

  ! or ? at the end of an object means it's just part of the object's name

  ! after a method means it mutatest the caller
  ? after a method means it returns a boolean value
  !!<some object> is used to turn any object into their boolean equivalent (true)
  !<some object> is used to turn any object into the opposite of their boolean equivalent (false)
=end

=begin

  # Question 3

  Replace the word "important" with "urgent" in this string:

  advice = "Few things in life are as important as house training your pet dinosaur."
  
  Answer:

  advice.gsub!("important", "urgent")
  
  Using the String#gsub! method we can pass in two arguments that will allow us
  to modify the string in place.  The first argument is the sub string we want
  to capture and the second argument is its replacement.  By using this version of this
  method, the change will be permanent.  In other words, the caller will be mutated.
  
=end


=begin

  Question 4

  The Ruby Array class has several methods for removing items from the array. 
  Two of them have very similar names. Let's see how they differ:

  numbers = [1,2,3,4]

  What do the following method calls do (assume we reset numbers to the original 
  array between method calls)?
  
  numbers.delete_at(1)
  numbers.delete(1)

  Answer:

  Array#delete_at method deletes the element at the specified index, returning that element, 
  or nil if the index is out of range.
  
  Array#delete eletes all items from the caller that are equal to the argument passed in.

  It's important to note that both of these methods are DESTRUCTIVE.  They perform the operation
  on the array in place and return the array with said values removed, based on which method is used.

  Array#delete_at will return the array with the value at said index removed.
  Array#delete will return the array with teh value passed in removed.
=end


=begin

  Question 5
  
  Programmatically determine if 42 lies between 10 and 100.

  Answer:

  (10..100).cover?(42)
  
  => true

  Range#cover method checks to see if the argument passed in is 
  between the beginning and end of the range.

=end

=begin
  
  Question 6

  Starting with the string:

  famous_words = "seven years ago..."
  
  show two different ways to put the expected "Four score and " in front of it.

  Answer:

  "Four score and " + famous_words

  famous_words.prepend("Four score and ")
  
=end


=begin 

  Question 8

  If we build an array like this:

  flintstones = ["Fred", "Wilma"]
  flintstones << ["Barney", "Betty"]
  flintstones << ["BamBam", "Pebbles"]
  
  We will end up with this "nested" array:

  ["Fred", "Wilma", ["Barney", "Betty"], ["BamBam", "Pebbles"]]

  Make this into an un-nested array.

  Answer:

  ["Fred", "Wilma", ["Barney", "Betty"], ["BamBam", "Pebbles"]].flatten!

  Array#flatten! is a destructive method that converts nested arrays
  into a single array.

=end

=begin
  
  Question 9

  Given the hash below

  flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }

  Turn this into an array containing only two elements: Barney's name and Barney's number

  Answer:

  flinststones.assoc("Barney")
  => ["Barney", 2]

  Hash#assoc method returns a key-value pair as an array once it finds a match for the parameter
  that was passed in.  Said parameter is always a key since it is unique, if a value is entered
  instead, it will return nil since values don't have to be unique in a hash.
=end

