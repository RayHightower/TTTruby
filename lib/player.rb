class Player

  attr_accessor :designation, :name

  def initialize(designation)
    @designation = designation
    @name = "Random Name"
  end

# This method does absolutely nothing!!!
#   def get_move
#     move = 9 # gets.chomp
#     puts "Okay #{self.designation}, your move is #{move}."
#     return move
#   end

end
