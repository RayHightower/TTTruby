#! /usr/bin/env ruby
# Entry point for the TTT game. Instantiates the Game object.
require_relative './gamerunner'

# Setup for main event loop.
thisgamerunner = GameRunner.new

game_is_active = true

# Main event loop.
while game_is_active
  mover = thisgamerunner.game.player[turn % 2]
  game_is_active = thisgamerunner.next_turn
end
