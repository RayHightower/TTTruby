#! /usr/bin/env ruby
require_relative './gamerunner'

thisgame = GameRunner.new(:droid)

thisgame.start_game

while thisgame.is_active
  thisgame.next_turn
end
