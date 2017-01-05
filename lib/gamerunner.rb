require_relative './game'

class Gamerunner
  attr_accessor :game

  def initialize
    @game = Game.new
    @game.player = [Player.new("X"), Player.new("O")]
  end



end
