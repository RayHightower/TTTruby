require 'io/console'
require_relative './grid'
require_relative './player'

WINNING_COMBOS = [
  [1, 2, 3],
  [4, 5, 6],
  [7, 8, 9],
  [1, 4, 7],
  [2, 5, 8],
  [3, 6, 9],
  [1, 5, 9],
  [3, 5, 7]
]

class Game

  attr_accessor :grid

  def initialize
    @grid = Grid.new
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

  def who_won
    ["X", "O"].find { |token| has_winning_combo?(token) }
  end

  def has_winning_combo?(token)
    WINNING_COMBOS.any? { |indices| all_items_equal?(indices, token) }
  end

  def all_items_equal?(indices, token)
    indices.map { |idx| grid.move_at(idx) }
      .all? { |item| item == token }
  end
end
