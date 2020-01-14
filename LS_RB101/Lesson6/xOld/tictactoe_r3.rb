require 'pry'
require 'yaml'

MESSAGES = YAML.load_file('ttt_messages.yml')

INITIAL_MARKER = " "
PLAYER_MARKER = "X"
COMPUTER_MARKER = "O"
VALID_CHOICES = ["player", "computer", "p", "c"]
BOARD_SECTION_STATIC = "     |     |"
BOARD_SECTION_INTERSECTION = "-----|-----|-----"
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9],
                 [1, 4, 7], [2, 5, 8], [3, 6, 9],
                 [1, 5, 9], [3, 5, 7]]

##-------------------- Prompts -------------------------#

def prompt(msg)
  puts("=>#{msg}")
end

def board_prompt(msg)
  puts("#{msg}")
end

##------------------------------------------------------#
##------------ Board set up and display ----------------#
##------------------------------------------------------#

def display_greeting
  prompt("You're a #{PLAYER_MARKER}, Computer is a #{COMPUTER_MARKER}")
end

def board_section_w_position(brd, num1, num2, num3)
  board_prompt("  #{brd[num1]}  |  #{brd[num2]}  |  #{brd[num3]}")
end

def board_pieces
  board_prompt(BOARD_SECTION_STATIC)
  board_prompt(BOARD_SECTION_INTERSECTION)
  board_prompt(BOARD_SECTION_STATIC)
end

def board_piece_top
  board_prompt(BOARD_SECTION_STATIC)
end

def display_board(brd, scores)
  system "clear"
  display_greeting
  display_score(scores)
  board_piece_top
  board_section_w_position(brd, 1, 2, 3)
  board_pieces
  board_section_w_position(brd, 4, 5, 6)
  board_pieces
  board_section_w_position(brd, 7, 8, 9)
  board_piece_top
end

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

##--------------------------------------------#
##--------------- Game Logic -----------------#
##--------------------------------------------#

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def joinor(arr, separator= ", ", and_or= "or")
  arr[-1] = "#{and_or} #{arr[-1]}"
  arr.join(separator)
end

def player_places_piece!(brd) # player_ai
  square = ''
  loop do
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt(MESSAGES['invalid_choice'])
  end
  brd[square] = PLAYER_MARKER
end

def computer_places_piece!(brd) #computer_ai
  square = nil

  # offense
  if !square
    WINNING_LINES.each do |line|
      square = find_at_risk_square(line, brd, COMPUTER_MARKER)
      break if square
    end
  end

  # defense first
  WINNING_LINES.each do |line|
    square = find_at_risk_square(line, brd, PLAYER_MARKER)
    break if square
  end

  # pick position 5 or a random square
  if !square
    brd[5] == INITIAL_MARKER ? square = 5 : square = empty_squares(brd).sample
  end

  brd[square] = COMPUTER_MARKER
end

# def place_piece!(current_player)
#   if current_player == players["p"]
#     players.fetch("p")
#   else
#     players.fetch("c")
#   end
# end

def find_at_risk_square(line, board, marker)
  if board.values_at(*line).count(marker) == 2
    board.select{|k,v| line.include?(k) && v == INITIAL_MARKER}.keys.first
  else
    nil
  end
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return "Player"
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return "Computer"
    end
  end
  nil
end

def who_goes_first
  choice = ''
  loop do
    puts "Choose who goes first: Enter (c) for computer or (p) for player"
    choice = gets.chomp.downcase
    break if VALID_CHOICES.include?(choice)
    puts "sorry that is not a valid choice"
  end
  choice
end

def player_first?(choice)
  choice.start_with?("p")
end

def place_piece!(brd, player)
  if player_first?(player)
    player_places_piece!(brd)
  else
    computer_places_piece!(brd)
  end
end

def alternate_player(player)
  player_first?(player) ? "computer" : "player"
end

def main_game_play(brd, scores)
  current_player = who_goes_first
  loop do
    display_board(brd, scores)

    prompt(MESSAGES['choose_position'])
    prompt(joinor(empty_squares(brd)).to_s)


    place_piece!(brd, current_player)
    current_player = alternate_player(current_player)
 
    break if someone_won?(brd) || board_full?(brd)
  end
  
  update_score(brd, scores)
end

def display_winner(brd)
  if someone_won?(brd)
    if detect_winner(brd) == 'Player'  
       prompt "#{detect_winner(brd)} won!"
    elsif detect_winner(brd) == 'Computer'
       prompt "#{detect_winner(brd)} won!"
    end        
  else
    prompt(MESSAGES['tie'])
  end
end

# --------- Score logic --------------#

scores = {:player => 0, :computer => 0}

def display_score(scores)
  prompt("Player: #{scores[:player]} || Comp: #{scores[:computer]}")
end

def update_score(brd, scores)
  if detect_winner(brd) == "Player"
    scores[:player] += 1
  elsif detect_winner(brd) == "Computer"
    scores[:computer] += 1
  end
  display_score(scores)
end

#---------------- Game Loop --------------------#

loop do
  board = initialize_board

  # ------ Start Game ---------#
  main_game_play(board, scores)
  #---- Display board again ----#
  display_board(board, scores)
  #----- Display Winner -------#
  display_winner(board)

  prompt(MESSAGES['play_again?'])
  answer = gets.chomp

  #update_score(board, scores)
  break if answer.downcase.start_with?("n")
end
#update_score(board, scores)
prompt(MESSAGES['goodbye'])

