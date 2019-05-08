require 'yaml'
MESSAGES = YAML.load_file('loan_calculator_messages.yml')

def prompt(message)
  puts "=> #{message}"
end

def display_greeting
  prompt(MESSAGES['welcome'])
end

def valid_number?(num)
  (num.to_i.to_s == num) && (num.to_i > 0)
end

def valid_float?(num)
  (num.to_f.to_s == num) && (num.to_f > 0)
end

def retrieve_loan_amount
  amount = ''

  loop do
    prompt(MESSAGES['loan_amount'])
    amount = gets.chomp

    break if valid_number?(amount)
    prompt(MESSAGES['zeros_or_letters_are_invalid'])
  end
  prompt("Your loan amount is $#{amount} dollars.")
  amount = amount.to_i
end

def retrieve_interest
  interest = ''

  loop do
    prompt(MESSAGES['interest_rate'])
    interest = gets.chomp

    break if valid_float?(interest) || valid_number?(interest)
    prompt(MESSAGES['invalid_interest_rate'])
  end
  prompt("Your interest rate is #{interest} percent")
  interest = (interest.to_f / 100) / 12
end

def retrieve_loan_duration
  duration = ''

  loop do
    prompt(MESSAGES['loan_duration'])
    duration = gets.chomp

    break if valid_number?(duration)
    prompt(MESSAGES['invalid_loan_duration'])
  end
  prompt("Your loan duration is #{duration} in years")
  duration = duration.to_i * 12
end

def perform_calculation(loan_amount, apr, duration)
  loan_amount * (apr /
                (1 - (1 + apr)**-duration))
end

def retrieve_play_again_answer
  prompt(MESSAGES['another_operation?'])
  gets.chomp
end

def acceptable_answers
  %w(y yes maybe Y YES MAYBE)
end

def another_operation?(answer, acceptable_answers)
  acceptable_answers.include?(answer)
end

def display_result(monthly_payment)
  prompt("Your monthly payment will be $#{format('%02.2f', monthly_payment)}")
end

def display_goodbye
  prompt(MESSAGES['goodbye'])
end

display_greeting
loop do
  loan_amount = retrieve_loan_amount
  apr = retrieve_interest
  duration = retrieve_loan_duration
  monthly_payment = perform_calculation(loan_amount, apr, duration)
  display_result(monthly_payment)
  play_again_answer = retrieve_play_again_answer
  break unless another_operation?(play_again_answer, acceptable_answers)
end
display_goodbye
