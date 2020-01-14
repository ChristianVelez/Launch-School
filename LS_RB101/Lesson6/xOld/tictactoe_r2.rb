require 'pry'

VALID_CHOICES = ["player", "computer"]

def player_plays
  "Player places piece"
end

def comp_plays
  "Computer places piece"
end

def players
  { "p" => player_plays, "c" => comp_plays }
end

def alternate_player(player_move)
  player_move == players["p"] ? players.fetch("c") : players.fetch("p")#player_plays ? comp_plays : player_plays
end

def who_goes_first
  choice = ''
  loop do
    puts "Choose who goes first: Enter (c) for computer or (p) for player"
    choice = gets.chomp.downcase
    break if players.has_key? choice
    puts "sorry that is not a valid choice"
  end
  choice
end

def set_first_player
  players.fetch(who_goes_first)
end

puts first_player = set_first_player

loop do
  puts current_player = alternate_player(first_player)
 
  break
end