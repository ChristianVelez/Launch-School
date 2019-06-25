require 'yaml'

MESSAGES = YAML.load_file('rpskl_messages.yml')

GAME_INFO = { 'r' => %w(s l),
              'p' => %w(r k),
              's' => %w(p l),
              'k' => %w(r s),
              'l' => %w(k p) }.freeze

def prompt(message)
  puts("=> #{message}")
end

def space
  puts
end

def valid_choice?(choice)
  GAME_INFO.key?(choice)
end

def display_choices(p1choice, p2choice)
  "You chose: #{long_form(p1choice)} || Computer chose: #{long_form(p2choice)}"
end

def winning_combos(p1choice, p2choice)
  GAME_INFO.fetch(p1choice).include?(p2choice)
end

def long_form(choice)
  return 'rock' if choice == 'r'
  return 'paper' if choice == 'p'
  return 'scissors' if choice == 's'
  return 'spock' if choice == 'k'
  return 'lizard' if choice == 'l'
end

def format_result(player, comp)
  player_wins_round = winning_combos(player, comp)
  comp_wins_round   = winning_combos(comp, player)

  if player_wins_round
    prompt("#{long_form(player)} beats #{long_form(comp)}")
  elsif comp_wins_round
    prompt("#{long_form(comp)} beats #{long_form(player)}")
  else
    prompt("It's a tie!")
  end
end

def display_score(score1, score2)
  prompt("Player: #{score1} || Computer: #{score2}")
end

def score_limit_reached?(player, computer)
  player == 5 || computer == 5
end

def declare_winner(score)
  score == 5 ? prompt(MESSAGES['win']) : prompt(MESSAGES['lose'])
end

comp_score = 0
player_score = 0

space
prompt(MESSAGES['first_to_five'])
space
prompt(MESSAGES['get_ready'])
space

loop do
  player_choice = ''

  prompt(MESSAGES['break'])
  space

  display_score(player_score, comp_score)
  space

  loop do
    prompt(MESSAGES['choose_one'])
    prompt(MESSAGES['choices'])

    player_choice = gets.chomp.downcase

    valid_choice?(player_choice) ? break : prompt(MESSAGES['invalid'])
  end

  comp_choice = GAME_INFO.keys.sample

  puts display_choices(player_choice, comp_choice)
  space

  player_wins = winning_combos(player_choice, comp_choice)
  comp_wins   = winning_combos(comp_choice, player_choice)

  format_result(player_choice, comp_choice)
  space

  player_score += 1 if player_wins
  comp_score += 1 if comp_wins

  display_score(player_score, comp_score)
  space

  sleep 1
  system('clear')

  break if score_limit_reached?(player_score, comp_score)
end

declare_winner(player_score)
space
prompt(MESSAGES['goodbye'])
space
