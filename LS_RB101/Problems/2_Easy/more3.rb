# For a series of non-negative integers up to n, 
# compute the sum of all terms after each has been squared and 1 added.

def sum_terms(n)
 (1..n).step(1) { |num| num + 1 }
end

puts sum_terms(3)