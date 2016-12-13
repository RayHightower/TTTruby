require_relative './grid'
require_relative './player'

class Game

  attr_accessor :grid

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

  def print_color_grid
    @grid.print_color_grid
  end

  def add_move(mover, move)
    @grid.add_move(mover.designation, move)
  end

  def check_winner
  # if @thisgame.check_winner
  #   puts "*** #{mover} wins! ***"
  #   break
  # end
    false
  end

end
