require 'yaml'
MESSAGES = YAML.load_file('loan_calculator_messages.yml')

def prompt(message)
  puts "=> #{message}"
end

def valid_number?(num)
  (num.to_i.to_s == num) && (num.to_i > 0)
end

def valid_float?(num)
  (num.to_f.to_s.to_i == num) && (num.to_f > 1)
end

def final_validation(num)
  valid_number?(num) || valid_float?(num)
end

def greeting
  prompt(MESSAGES['welcome'])
end

def input_order
  ['loan amount', 'interest rate', 'loan duration in years']
end

def valid_input(input_order)
  input = ''
  loop do
    prompt("Please enter the #{input_order}")
    input = gets.chomp
    final_validation(input) ? break : prompt(MESSAGES['invalid_input'])
  end
  input
end

def format_numbers
  @amount = valid_input(input_order[0])
  @interest = valid_input(input_order[1])
  @duration = valid_input(input_order[2])
end

def grab_input
  @loan_amount = @amount.to_f
  @interest_rate = (@interest.to_f / 100) / 12
  @loan_duration = @duration.to_f * 12
end

def perform_operation
  grab_input
  @monthly_payment = @loan_amount *
                     (@interest_rate /
                     (1 - (1 + @interest_rate)**-@loan_duration))
end

def display_result
  perform_operation
  prompt("Your monthly payment will be $#{format('%02.2f', @monthly_payment)}")
end

def another_operation?
  prompt(MESSAGES['another_calculation'])
  answer = gets.chomp.downcase

  answer.start_with?('y') ? display_info : prompt(MESSAGES['goodbye'])
end

def display_info
  greeting
  format_numbers
  display_result
  another_operation?
end

display_info
