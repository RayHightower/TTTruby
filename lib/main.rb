# Entry point for the TTT game. Instantiates the Game object.
#

require_relative './game'

# Setup for main event loop.
@thisgame = Game.new
@player = []
@player[0] = Player.new
@player[1] = Player.new

puts "\nWelcome to Tic Tac Toe\nYou know the rules. Here's the grid.\n"
@thisgame.print_grid

turn = 0

# Main event loop.
while true
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
