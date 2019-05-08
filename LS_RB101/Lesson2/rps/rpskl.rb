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

def first_to_five
  prompt(MESSAGES['first_to_five'])
end

def start
  prompt(MESSAGES['get_ready'])
end

def divider
  prompt(MESSAGES['break'])
end

def space
  puts
end

def game_info
  { 'rock'     => %w(scissors lizard),
    'paper'    => %w(rock spock),
    'scissors' => %w(paper lizard),
    'spock'    => %w(rock scissors),
    'lizard'   => %w(spock paper) }
end

def choice_matches?(choice)
  VALID_CHOICES.key?(choice)
end

def retrieve_choice(choice)
  VALID_CHOICES.fetch(choice)
end

def validate_choice(choice)
  retrieve_choice(choice) if choice_matches?(choice)
end

def retrieve_game_info(choice)
  game_info.fetch(choice)
end

def winning_combinations?(player1, player2)
  retrieve_game_info(player1).include?(player2)
end

def score_limit_reached?(player, computer)
  player == 5 || computer == 5
end

def declare_winner(player_score)
  player_score == 5 ? prompt(MESSAGES['win']) : prompt(MESSAGES['lose'])
end

def display_results(player, computer)
  if winning_combinations?(player, computer)
    prompt("#{player} beats #{computer}")
  elsif winning_combinations?(computer, player)
    prompt("#{computer} beats #{player}")
  else
    prompt(MESSAGES['tie'])
  end
end

comp_score = 0
player_score = 0

first_to_five
space
start
space

loop do
  player_choice = ''

  divider
  space

  loop do
    prompt(MESSAGES['choose_one'])
    prompt(MESSAGES['choices'])

    player_choice = validate_choice(gets.chomp)

    VALID_CHOICES.value?(player_choice) ? break : prompt(MESSAGES['invalid'])
  end

  comp_choice = VALID_CHOICES.values.sample

  prompt("You chose: #{player_choice} || Computer chose: #{comp_choice}")
  space

  point_for_player   = winning_combinations?(player_choice, comp_choice)
  point_for_computer = winning_combinations?(comp_choice, player_choice)

  display_results(player_choice, comp_choice)
  space

  prompt("Player: #{point_for_player ? player_score += 1 : player_score}")
  prompt("Computer: #{point_for_computer ? comp_score += 1 : comp_score}")
  space

  break if score_limit_reached?(player_score, comp_score)
end

declare_winner(player_score)
space
prompt(MESSAGES['goodbye'])
