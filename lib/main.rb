#! /usr/bin/env ruby
# Entry point for the TTT game. Instantiates the Game object.
require_relative './game'

# Setup for main event loop.
thisgame = Game.new

puts "\nWelcome to Tic Tac Toe!\nYou know the rules. Here's the grid.\n"
thisgame.print_color_grid

turn = 1
game_is_active = true

# Main event loop.
while game_is_active
  mover = player[turn % 2]
  print "\nYour move, #{mover.designation}: "
  move = STDIN.getch.to_i

  while !thisgame.add_move(mover, move)
    puts "No way, Player #{mover.designation}. Illegal move. Try again."
    move = STDIN.getch.to_i
  end

  thisgame.print_color_grid

  if (thisgame.check_winner)
      print "\e[#{93}m#{"\n*** Player #{mover.designation} wins! ***\n"}\e[0m"
      game_is_active = false
  end

  if (turn >= 9 && game_is_active)
    print "\n**** Tie game. ***\n"
    game_is_active = false
  end

  turn = turn + 1
end
