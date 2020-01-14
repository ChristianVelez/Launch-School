# def get_fib_numbers(end_point)
#   number1, number2 = 0, 1
#   number3 = number1 + number2 
#   fib_array = [0, 1]
  
#   loop do
    
#     fib_array << number1 + number2
#     number1, number2 = number2, number3
#     number3 = number1 + number2

#     break if number3.to_s.length == end_point
#   end
#   result = fib_array.index(fib_array[-1]) + 1
# end

# get_fib_numbers(2)

# def find_fibonacci_index_by_length(number_digits)
#   first = 1
#   second = 1
#   index = 2

#   loop do
#     index += 1
#     fibonacci = first + second
#     break if fibonacci.to_s.size >= number_digits

#     first = second
#     second = fibonacci
#   end

#   index
# end

#puts find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
# find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
# find_fibonacci_index_by_length(10) == 45
# find_fibonacci_index_by_length(100) == 476
# find_fibonacci_index_by_length(1000) == 4782
# find_fibonacci_index_by_length(10000) == 47847

# def get_fib_numbers(end_point)
#   number1, number2 = 1, 1
#   index = 2

#   loop do
#     index += 1
#     last_num = number1 + number2
#     number3 = number1 + number2

#     break if last_num.to_s.length == end_point

#     number1 = number2
#     number2 = last_num
#   end
#   index
# end


def find_fibonacci_index_by_length(end_point)
  first_num, second_num, index = 1, 1, 2
  fib = 0
  
  until fib.to_s.length == end_point
    index += 1

    fib = first_num + second_num
    first_num, second_num = second_num, fib
  end

  index
end

puts find_fibonacci_index_by_length(10)