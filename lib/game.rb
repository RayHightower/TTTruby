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


puts "\nWelcome to Tic Tac Toe\nYou know the rules. Here's the grid.\n"
@thisgame.print_grid

turn = 0

while true
  turn = turn + 1
  mover = @player[turn % 2]
  move = gets.chomp
  puts "Your move is #{move}."
end
