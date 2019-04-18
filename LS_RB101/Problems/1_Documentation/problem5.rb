# What do each of these puts statements output?

a = %w(a b c d e)
puts a.fetch(7) 
# out of range, error
# => index 7 outside of array bounds: -5...5 (IndexError)
puts a.fetch(7, 'beats me') 
# still out of range but uses default argument
# => "beats me"
puts a.fetch(7) { |index| index**2 } 
# value does not exist but the block will execute with the value passed as a parameter
# => 49