require_relative './grid'

class Player

  attr_accessor :designation, :type, :name
  # :designation = X or O
  # :type = :human or :android
  # :name = Player's name in the real world, if they want to share it

  def initialize(designation, type=:human)
    @designation = designation
    @name = "Random Name"
    @type = type
  end

  def get_move(current_grid)
    if self.type == :human
      $stdin.getch.to_i  # Eventually we want to get the move from somewhere other than the console.
      return
    end

    if self.type == :droid
      minimax(self, current_grid)
    end
  end

  def minimax(current_player, current_grid)
    3
  end
end
