require_relative './grid'
require_relative './player'

class Game

  def initialize
    @grid = Grid.new
    @playerX = Player.new
    @player0 = Player.new
  end

  def get_status
    [ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ]
  end

end
