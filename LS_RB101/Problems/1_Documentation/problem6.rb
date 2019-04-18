# What will the following code print

5.step(to: 10, by: 3) { |value| puts value }

# => 5, 8

# 5 is the starting point and we are using the 'step' method
# to step through the parameters that are provided.

# Notice the to: and by: parameters
# to: is our limit, it's as far as we can go
# by: is the value by which we will increment our number until we reach our limit