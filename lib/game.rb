require_relative './grid'
require_relative './player'

class Game

  def initialize
    @grid = Grid.new
    @playerX = Player.new
    @player0 = Player.new
  end

  def print_status

  end

end
