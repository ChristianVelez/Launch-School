require 'yaml'

RANK = [*(2..10), 'jack', 'queen', 'king', 'ace']
SUIT = %w(♣ ♥ ♠ ♦)

HIT_STAY = %w(h s)
ROUND_WINNER = 5
MESSAGES = YAML.load_file('twentyone.yml')

def prompt(message)
  puts <<~MSG
          #{message}
          MSG
end

def clear_screen
  system('clear') || system('cls')
end

def display_greeting
  prompt <<~LASTCARD

            welcome to twenty one

            the rules are simple, cards will be dealt to both players with
            the player's cards made available for all to see while the dealer
            will only display one of its cards, regardless of how many they draw.
            the player closest to 21 points wins the round.  win 5 rounds and you
            win the match.

            ready?

            let's play
            LASTCARD
  sleep 3
end

def display_farewell
  prompt(MESSAGES['goodbye'])
end

# ======= Initialize Deck and Players ======= #

def initialize_player(name)
  {
    name: name.to_s,
    hand: [],
    total: 0,
    wins: 0,
    busted: false
  }
end

def initialize_deck
  RANK.product(SUIT).shuffle!
end

# ======= Card Dealing logic ======= #

def deal_hand(player, deck, cards_dealt = 1)
  cards_dealt.times { player[:hand] << deck.pop }
  update_total(player)
end

# ======= Card values logic ======= #

# rubocop:disable Metrics/MethodLength
def update_total(player)
  values = player[:hand].collect(&:first)
  total  = 0

  values.each do |value|
    case value
    when 'ace'
      total += 11
    when 'jack', 'queen', 'king'
      total += 10
    else
      total += value
    end
  end

  # correct for Aces
  values.select { |value| value == 'ace' }.count.times do
    total -= 10 if total > 21
  end

  player[:total] = total
end
# rubocop:enable Metrics/MethodLength

# ======= Card display ======= #

def format_hand(player)
  player[:hand].flatten
               .each_slice(2)
               .map { |card| "[ #{card.first} #{card.last} ]" }
               .join
end

def current_player_hand_display(player)
  prompt <<~DEALCARDS
          --- #{player[:name]}

          #{format_hand(player)} : #{player[:total]}
         DEALCARDS
end

def current_dealer_hand_display(player)
  prompt <<~DEALCARDS
          --- #{player[:name]}

          [ #{player[:hand].first.join(' ')} ][ ? ] : ?
         DEALCARDS
end

def show_last_card_drawn(player)
  prompt <<~LASTCARD

          --- card drawn by #{player[:name]}

          [ #{player[:hand].last.join(' ')} ]
            LASTCARD
end

def display_both_hands(player, dealer)
  current_player_hand_display(player)
  current_dealer_hand_display(dealer)
end

def end_of_round_card_display(player, dealer)
  current_player_hand_display(player)
  current_player_hand_display(dealer)
end

def display_score(player, dealer)
  prompt <<~SCOREBOARD
          --- scoreboard

          #{player[:name]}: #{player[:wins]}

          #{dealer[:name]}: #{dealer[:wins]}
            SCOREBOARD
end

#======= Player turn =======#

def player_prompt
  answer = ''
  loop do
    prompt(MESSAGES['hit_or_stay?'])
    answer = gets.chomp.downcase
    break if HIT_STAY.include?(answer)
    prompt(MESSAGES['invalid_choice'])
  end
  answer
end

def player_hits(answer, player, deck)
  if answer == "h"
    deal_hand(player, deck)
    update_total(player)
    show_last_card_drawn(player)
    sleep 1
    current_player_hand_display(player)
  end
end

def player_turn(player, deck)
  player_turn = ''

  loop do
    player_turn = player_prompt
    player_hits(player_turn, player, deck)

    break if busted?(player) || player_turn == "s"
  end

  player_stays_or_busts(player)
  sleep 0.5
end

# ======= Dealer Turn ======= #

def dealer_hits(player, deck)
  loop do
    break if player[:total] >= 17
    prompt("dealer hits....")
    deal_hand(player, deck)
    update_total(player)
  end
end

def dealer_turn(player, deck)
  dealer_hits(player, deck)
  player_stays_or_busts(player)
  sleep 0.5
end

# ======= Winning logic ======= #

def player_stays_or_busts(player)
  if busted?(player)
    player[:busted] = true
  else
    prompt <<~STAY
              #{player[:name]} stays at #{player[:total]}

              STAY
  end
end

def busted?(player)
  player[:total] > 21
end

def determin_round_winner(player, dealer)
  return dealer[:name] if busted?(player)
  return dealer[:name] if dealer[:total] > player[:total]
  return player[:name] if busted?(dealer)
  return player[:name] if player[:total] > dealer[:total]
  return 'tie' if player[:total] == dealer[:total]
end

def round_winner(player)
  player[:wins] == ROUND_WINNER
end

def someone_won_round?(player, dealer)
  round_winner(player) || round_winner(dealer)
end

# rubocop:disable Metrics/MethodLength

def declare_winner(player, dealer)
  winner = determin_round_winner(player, dealer)

  if busted?(player)
    prompt('player busts...dealer wins this round')
    update_wins(dealer)
  elsif busted?(dealer)
    prompt('dealer busts...player wins this round')
    update_wins(player)
  elsif winner == 'player'
    prompt('player wins this round')
    update_wins(player)
  elsif winner == 'dealer'
    prompt('dealer wins this round')
    update_wins(dealer)
  elsif winner == 'tie'
    prompt("it's a tie")
  end
end

def update_wins(player)
  player[:wins] += 1
end

# rubocop:enable Metrics/MethodLength

def show_cards_and_score(player, dealer)
  end_of_round_card_display(player, dealer)
  declare_winner(player, dealer)
  display_score(player, dealer)
  clear_both_decks(player, dealer)
end

def display_game_winner(player, dealer)
  return prompt "#{player[:name]} wins the game" if round_winner(player)
  return prompt "#{dealer[:name]} wins the game" if round_winner(dealer)
end

# ======= Play again? ======= #

def clear_deck(player)
  player[:hand] = []
  player[:total] = 0
  player[:busted] = false
end

def clear_both_decks(player, dealer)
  clear_deck(player)
  clear_deck(dealer)
end

def play_again?
  prompt('do you want to play again? (y or n)')
  answer = gets.chomp.downcase
  answer.start_with?('y')
end

loop do
  display_greeting

  new_deck = initialize_deck

  player   = initialize_player("player")
  dealer   = initialize_player("dealer")

  loop do
    prompt(MESSAGES['cards_dealt'])

    if new_deck.count < 10
      new_deck = initialize_deck
    else
      new_deck
    end

    sleep 2
    clear_screen

    deal_hand(player, new_deck, 2)
    deal_hand(dealer, new_deck, 2)

    prompt("there are #{new_deck.count} cards left in the deck")

    display_score(player, dealer)
    display_both_hands(player, dealer)

    player_turn(player, new_deck)

    clear_screen

    display_score(player, dealer)
    display_both_hands(player, dealer)

    if busted?(player)
      determin_round_winner(player, dealer)
    else
      dealer_turn(dealer, new_deck)
      sleep 3
    end

    sleep 3

    determin_round_winner(player, dealer)
    clear_screen

    show_cards_and_score(player, dealer)

    sleep 3

    break if someone_won_round?(player, dealer)
  end

  display_game_winner(player, dealer)

  break unless play_again?
end

display_farewell
