class Player

  attr_accessor :designation

  def initialize(designation)
    @designation = designation
    @name = "Random Name"
  end

  def name
    @name
  end

  def get_move
    move = 9 # gets.chomp
    puts "Okay #{self.designation}, your move is #{move}."
    return move
  end

end
