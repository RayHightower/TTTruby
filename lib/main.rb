#! /usr/bin/env ruby
# Entry point for the TTT game. Instantiates the GameRunner object.
require_relative './gamerunner'

thisgame = GameRunner.new

while thisgame.is_active
  mover = thisgame.game.player[1] # main.rb knows too much about the GameRunner class?
  thisgame.next_turn(mover)
end
