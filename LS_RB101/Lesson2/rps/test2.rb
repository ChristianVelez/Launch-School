require 'yaml'
MESSAGES = YAML.load_file('rpskl_messages.yml')

VALID_CHOICES = { 'r' => 'rock',
                  'p' => 'paper',
                  's' => 'scissors',
                  'k' => 'spock',
                  'l' => 'lizard' }.freeze

def prompt(message)
  puts("=> #{message}")
end

def game_info
  { 'rock' => %w(scissors lizard),
    'paper' => %w(rock spock),
    'scissors' => %w(paper lizard),
    'spock' => %w(rock scissors),
    'lizard' => %w(spock paper) }
end

def validate_choice(choice)
  VALID_CHOICES.fetch(choice) if VALID_CHOICES.key?(choice)
end

def retrieve_game_info(choice)
  game_info.fetch(choice)
end

def score_limit_reached(player, computer)
  player == 5 || computer == 5
end

def display_results(player, computer)
  winning_player_combinations = retrieve_game_info(player)
  winning_computer_combinations = retrieve_game_info(computer)

  if winning_player_combinations.include?(computer)
    prompt("#{player} " + MESSAGES['win'])
  elsif winning_computer_combinations.include?(player)
    prompt("#{computer} " + MESSAGES['win'])
  else
    prompt(MESSAGES['tie'])
  end
end

computer_score = 0
player_score = 0

loop do
  choice = ''
  player_choice = ''

  loop do
    prompt(MESSAGES['choose_one'])
    prompt(MESSAGES['choices'])
    choice = gets.chomp
    player_choice = validate_choice(choice)

    if VALID_CHOICES.value?(player_choice)
      break
    else
      prompt(MESSAGES['invalid_choice'])
    end
  end

  computer_choice = VALID_CHOICES.values.sample

  prompt("You chose: #{player_choice} || Computer chose: #{computer_choice}")

  point_for_player = retrieve_game_info(player_choice)
  point_for_computer = retrieve_game_info(computer_choice)

  display_results(player_choice, computer_choice)

  prompt("Player: #{point_for_player.include?(computer_choice) ? player_score += 1 : player_score}")
  prompt("Computer: #{point_for_computer.include?(player_choice) ? computer_score += 1 : computer_score}")

  break if score_limit_reached(player_score, computer_score)
end

prompt(MESSAGES['goodbye'])
