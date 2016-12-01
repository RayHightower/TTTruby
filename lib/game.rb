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

  def get_move(mover)
    move = gets.chomp
    puts "Okay #{mover.designation}, your move is #{move}."
  end

  def check_winner
    true
  end

end
