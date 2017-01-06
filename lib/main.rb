#! /usr/bin/env ruby
# Entry point for the TTT game. Instantiates the GameRunner object.
require_relative './gamerunner'

thisgame = GameRunner.new

while thisgame.is_active
  thisgame.next_turn
end
