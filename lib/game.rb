require 'io/console'
require_relative './grid'
require_relative './player'

class Game

  attr_accessor :grid, :player

  def initialize
    @grid = Grid.new
    @player = []
  end

  def get_status
    @grid.contents
  end

  def print_color_grid
    @grid.print_color_grid
  end

  def add_move(mover, move)
    @grid.add_move(mover.designation, move)
  end

  def check_winner

    winner = false

    if @grid.who_won == "X" || @grid.who_won == "O" then winner = true
    end

    return winner
  end
end
