class Player

  attr_accessor :designation, :name, :type

  def initialize(designation, type=:human)
    @designation = designation
    @name = "Random Name"
    @type = type
  end

  def get_move
    if self.type == :human
      $stdin.getch.to_i  # Eventually we want to get the move from somewhere other than the console.
    end

    # If this is an artificial player, get the move from the AI algorithm.

  end

# This method does absolutely nothing!!!
#   def get_move
#     move = 9 # gets.chomp
#     puts "Okay #{self.designation}, your move is #{move}."
#     return move
#   end

end
