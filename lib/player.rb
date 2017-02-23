require_relative './grid'

class Player

  attr_accessor :designation, :name, :type

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
      return 9
    end
  end
end
