# def players
#   { "player" => player_places_piece, "computer" => comp_places_piece}
# end

def comp_places_piece
  "Computer places piece"
end

def player_places_piece
  "Player places piece"
end

# def place_piece(current_player)
#   if current_player == "player"#players["player"]
#     player_places_piece
#   elsif current_player == "computer"#players["computer"]
#     comp_places_piece
#   end
# end

# # p players["computer"]

# #puts players.include?("player")
# current_player = players["player"]
# place_piece(current_player)

def players 
  { "player" => player_places_piece, "computer" => comp_places_piece}
end

test = players.keys.first

p test.start_with?("p")