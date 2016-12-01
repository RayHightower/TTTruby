require_relative './grid'
require_relative './player'

class Game

  def initialize
    @grid = Grid.new
    @player = []
  end

  def get_status
    @grid.contents
  end

  def print_grid
    @grid.print_grid
  end

end


# Main event loop begins here.

@thisgame = Game.new
@player = []
@player[0] = Player.new
@player[1] = Player.new


