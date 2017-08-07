require 'rack'
require 'io/console'
require_relative './grid'
require_relative './player'

class Game

  attr_accessor :grid, :player

  def initialize
    @grid = Grid.new
    @player = []
  end

  def call(env)  # To support Rack.
    pp env
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
end
