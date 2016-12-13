# Entry point for the TTT game. Instantiates the Game object.
#

require_relative './game'

# Setup for main event loop.
thisgame = Game.new
player = []
player[0] = Player.new("X")
player[1] = Player.new("O")

puts "\nWelcome to Tic Tac Toe!\nYou know the rules. Here's the grid.\n"
thisgame.print_color_grid

turn = 1
game_is_active = true

# Main event loop.
while game_is_active
  print "#{game_is_active} turn = #{turn}\n\n"

  mover = player[turn % 2]
  move = gets.chomp.to_i

  while !thisgame.add_move(mover, move)
    puts "No way, Player #{mover.designation}. Illegal move. Try again."
    move = gets.chomp.to_i
  end

  puts "You placed your #{mover.designation} at position #{move}.\n\n"
  thisgame.print_color_grid

  if (thisgame.check_winner)
      print "*** Player #{mover.designation} wins! ***"
      game_is_active = false
  end

  if (turn >= 9)
    print "**** Tie game. ***"
    game_is_active = false
  end

  turn = turn + 1
  print "\n\nturn = #{turn}\n\n"
end
