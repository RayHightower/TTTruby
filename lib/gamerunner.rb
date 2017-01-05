require_relative './game'

class GameRunner
  attr_accessor :game

  def initialize
    @game = Game.new
    @game.player = [Player.new("X"), Player.new("O")]
  end

  def get_status
    @game.get_status
  end

  def next_turn

  end
end
