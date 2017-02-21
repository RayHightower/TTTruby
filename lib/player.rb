class Player

  attr_accessor :designation, :name

  def initialize(designation)
    @designation = designation
    @name = "Random Name"
  end

  def get_move
    # If this is a human player, get the move from the console.
    $stdin.getch.to_i  # Eventually we want to get the move from somewhere other than the console.

    # If this is an artificial player, get the move from the AI algorithm.

  end

# This method does absolutely nothing!!!
#   def get_move
#     move = 9 # gets.chomp
#     puts "Okay #{self.designation}, your move is #{move}."
#     return move
#   end

end
