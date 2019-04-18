=begin 
 Write a method that counts the number of occurrences of each element in a given array.
 
 Example:

 vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

count_occurrences(vehicles)

 Expected output:

 car => 4
 truck => 3
 SUV => 1
 motorcycle => 2 
=end

# Iterate over the vehicles array and group all similar values
# which gives us a hash where the key is a string that 
# represents the name of the values we have grouped and the value
# is an array containing all similar values of that were grouped together
# This version is case sentitive and will treat "suv" as != to "SUV"

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

def count_occurrences(arr)
  arr.group_by{ |vehicle| vehicle }.each { |key, arr| puts "#{key} => #{arr.count}"} 
end

count_occurrences(vehicles)

# car => 4
# truck => 3
# suv => 1
# motorcycle => 2

# This a case insentive version of the above program. 

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck', 'TRUCK',
  'suv', 'Car', "MOTORCYCLE"
]

def count_occurrences(arr)
  arr.map(&:downcase).group_by{ |vehicle| vehicle }.each { |key, arr| puts "#{key} => #{arr.count}"} 
end

count_occurrences(vehicles)

# car => 5
# truck => 4
# suv => 2
# motorcycle => 3