require 'io/console'
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

    winner = false

    (@grid.contents[1] == @grid.contents[2] && @grid.contents[2] == @grid.contents[3]) ? winner = true : false
    (@grid.contents[4] == @grid.contents[5] && @grid.contents[5] == @grid.contents[6]) ? winner = true : false
    (@grid.contents[7] == @grid.contents[8] && @grid.contents[8] == @grid.contents[9]) ? winner = true : false

    (@grid.contents[1] == @grid.contents[4] && @grid.contents[4] == @grid.contents[7]) ? winner = true : false
    (@grid.contents[2] == @grid.contents[5] && @grid.contents[5] == @grid.contents[8]) ? winner = true : false
    (@grid.contents[3] == @grid.contents[6] && @grid.contents[6] == @grid.contents[9]) ? winner = true : false

    (@grid.contents[1] == @grid.contents[5] && @grid.contents[5] == @grid.contents[9]) ? winner = true : false
    (@grid.contents[3] == @grid.contents[5] && @grid.contents[5] == @grid.contents[7]) ? winner = true : false

    return winner
  end

end
