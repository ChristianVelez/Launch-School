require 'yaml'
require 'pry'
MESSAGES = YAML.load_file('ttt_messages.yml')

# --------------------------------------#
# ---------- Game Constants ------------#
# --------------------------------------#

AVAILABLE_PLAYERS = ['player', 'computer']
INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
BOARD_SECTION_STATIC = '     |     |'
BOARD_SECTION_INTERSECTION = '-----+-----+-----'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9],
                 [1, 4, 7], [2, 5, 8], [3, 6, 9],
                 [1, 5, 9], [3, 5, 7]]

# --------------------------------------#
# -------------- Prompts ---------------#
# --------------------------------------#

def prompt(message)
  puts("=> #{message}")
end

def board_prompt(message)
  puts(message)
end

def space
  puts
end

#---------------------------------------#
#----------- Game Prompts --------------#
#---------------------------------------#

def display_greeting
  prompt(MESSAGES["welcome"])
end

def display_rules
  prompt(MESSAGES['match_winner'])
end

def display_farewell
  prompt(MESSAGES['goodbye'])
end

def display_markers
  board_prompt("You're an #{PLAYER_MARKER}, Computer is a #{COMPUTER_MARKER}")
end

#------------------------------------------------------#
#------------ Board set up and display ----------------#
#------------------------------------------------------#

def clear_screen
  system('cls') || system('clear')
end

def board_piece_top_and_bottom
  board_prompt(BOARD_SECTION_STATIC)
end

def board_section_middle
  board_prompt(BOARD_SECTION_STATIC)
  board_prompt(BOARD_SECTION_INTERSECTION)
  board_prompt(BOARD_SECTION_STATIC)
end

def board_section_w_position(brd, pos1, pos2, pos3)
  board_prompt("  #{brd[pos1]}  |  #{brd[pos2]}  |  #{brd[pos3]}")
end

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def board_construct(brd)
  board_piece_top_and_bottom
  board_section_w_position(brd, 1, 2, 3)
  board_section_middle
  board_section_w_position(brd, 4, 5, 6)
  board_section_middle
  board_section_w_position(brd, 7, 8, 9)
  board_piece_top_and_bottom
end

def display_board(brd, scores)
  clear_screen
  display_markers
  space
  update_score(brd, scores)
  space
  board_construct(brd)
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def remaining_squares(options, separator= ", ", and_or= "or")
  if options.length == 1
    # {}"#{options.first}"
    options.first.to_s
  else
    options[-1] = "#{and_or} #{options.last}"
    options.join(separator)
  end
end

def display_remaining_squares(brd)
  remaining_squares(empty_squares(brd)).to_s
end

#------------------------------------------------------#
#----------- Player & Computer formatting -------------#
#------------------------------------------------------#

def valid_player?(choice)
  AVAILABLE_PLAYERS.any? { |player| player.start_with?(choice.chars.first) }
end

def format_players(player)
  player == 'p' ? 'Player' : 'Computer'
end

def who_goes_first
  choice = ''
  loop do
    prompt(MESSAGES["player_choice"])
    choice = gets.chomp.downcase
    break if valid_player?(choice)
    prompt(MESSAGES["invalid_choice"])
  end
  choice = format_players(choice)
  prompt("You have chosen #{choice} to start off the game. Let's begin!")
  sleep 1
  choice.downcase
end

#------------------------------------------------------#
#-------------------- Game logic ----------------------#
#------------------------------------------------------#

def begin_game
  display_greeting
  sleep 1
  display_rules
  sleep 2
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def round_won?(brd)
  !!detect_round_winner(brd)
end

def detect_round_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return AVAILABLE_PLAYERS.first.capitalize # "Player"
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return AVAILABLE_PLAYERS.last.capitalize # "Computer"
    end
  end
  nil
end

def display_round_winner(brd)
  if round_won?(brd)
    prompt("#{detect_round_winner(brd)} has won this round!")
  else
    prompt(MESSAGES['tie'])
  end
end

def main_game_loop(brd, scores)
  current_player = who_goes_first

  loop do
    display_board(brd, scores)
    place_piece!(brd, current_player)
    current_player = alternate_player(current_player)
    break if round_won?(brd) || board_full?(brd)
  end
end

def play_again?
  prompt(MESSAGES['play_again?'])
  answer = gets.chomp.downcase
  answer.start_with?('n')
end

def next_match?
  prompt("Ready for your next match? (y or n)")
  answer = gets.chomp.downcase
  answer.start_with?('y')
end

def game_won?(scores)
  scores.any? { |_, score| score == 3 }
end

def detect_game_winner(scores)
  scores.select { |_, score| score == 3 }.keys.first
end

def display_game_winner(scores)
  if game_won?(scores)
    prompt("#{detect_game_winner(scores)} has won the game!")
  end
end

#------------------------------------------------------#
#--------------- Player & Computer AI -----------------#
#------------------------------------------------------#

def player_move!(brd)
  square = ''
  loop do
    space
    prompt("Choose a position for your marker: #{display_remaining_squares(brd)}")
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt(MESSAGES["square_taken"])
  end
  brd[square] = PLAYER_MARKER
end

def computer_move!(brd)
  square = nil

  # attack
  if !square
    WINNING_LINES.each do |line|
      square = find_at_risk_square!(line, brd, COMPUTER_MARKER)
      break if square
    end
  end

  # defense
  WINNING_LINES.each do |line|
    square = find_at_risk_square!(line, brd, PLAYER_MARKER)
    break if square
  end

  # pick random square or square 5
  if !square
    brd[5] == INITIAL_MARKER ? square = 5 : square = empty_squares(brd).sample
  end

  brd[square] = COMPUTER_MARKER
end

def place_piece!(brd, player)
  if player == "player"
    player_move!(brd)
  elsif player == "computer"
    computer_move!(brd)
  end
end

def find_at_risk_square!(line, brd, marker)
  if brd.values_at(*line).count(marker) == 2
    brd.select { |k, v| line.include?(k) && v == INITIAL_MARKER }.keys.first
  end
end

def alternate_player(player)
  player == "player" ? "computer" : "player"
end

#------------------------------------------------------#
#--------------------- Score logic --------------------#
#------------------------------------------------------#

def players
  AVAILABLE_PLAYERS
end

scores = { players.first => 0, players.last => 0 }

def display_score(scores)
  player   = players.first
  computer = players.last

  board_prompt("Player: #{scores[player]} || Computer: #{scores[computer]}")
end

def update_score(brd, scores)
  player   = players.first
  computer = players.last

  scores[player]   += 1 if detect_round_winner(brd) == 'Player'
  scores[computer] += 1 if detect_round_winner(brd) == 'Computer'

  display_score(scores)
end

#------------------------------------------------------#
#------------------- Game Execution -------------------#
#------------------------------------------------------#

begin_game

loop do
  loop do
    board = initialize_board

    main_game_loop(board, scores)
    display_board(board, scores)
    display_round_winner(board)

    break if game_won?(scores)
    break unless next_match?
  end

  display_game_winner(scores)
  break if play_again?
end

display_farewell
