# Entry point for the TTT game. Instantiates the Game object.
#

require_relative './game'

# Setup for main event loop.
@thisgame = Game.new
@player = []
@player[0] = Player.new("X")
@player[1] = Player.new("O")

puts "\nWelcome to Tic Tac Toe\nYou know the rules. Here's the grid.\n"
@thisgame.print_grid

turn = 0
game_is_active = :true

# Main event loop.
while game_is_active
  turn = turn + 1
  mover = @player[turn % 2]
  move = gets.chomp
  puts "Okay #{mover.designation}, your move is #{move}."
  # @thisgame.get_move(mover)

  # if @thisgame.check_winner
  #   puts "*** #{mover} wins! ***"
  #   break
  # end
end
