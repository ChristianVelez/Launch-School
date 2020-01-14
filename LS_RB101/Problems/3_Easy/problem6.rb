# Exclusive Or

def xor(num1, num2)
  (num1 && !num2) || (num2 && !num1)
end

# p xor(5.even?, 4.even?)
# p xor(5.odd?, 4.odd?)
# p xor(5.odd?, 4.even?)
# p xor(5.even?, 4.odd?)

num1 = 5
num2 = 4

puts !num2.odd?

# !value is false, meaning it forces the value to be false
# so in the above method, inside the first parentheses
# (num1 && !num2) is equal to (true && false)