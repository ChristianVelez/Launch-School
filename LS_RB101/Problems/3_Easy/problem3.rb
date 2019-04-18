=begin
Create a simple tip calculator. The program should prompt 
for a bill amount and a tip rate. The program must compute 
the tip and then display both the tip and the total amount 
of the bill.

Examples:

What is the bill? 200
What is the tip percentage? 15

The tip is $30.0
The total is $230.0
=end

def tip_calculator
  puts "What is the bill?"
  bill = gets.chomp.to_f
  puts "What is the tip percentage?"
  tip = gets.chomp.to_f

  calculated_tip = (tip * 0.01) * bill
  final_bill = [calculated_tip, bill].reduce(:+)

  puts "The tip is $#{"%.2f" % calculated_tip}\nThe total is $#{"%.2f" % final_bill}"
end

tip_calculator


# num = 11

# puts %( #{'%.2f' % num} )