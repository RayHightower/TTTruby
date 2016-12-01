class Player

  def initialize
    @designation = "X"
    @name = "Random Name"
  end

  def designation
    @designation
  end

  def name
    @name
  end

end

@player = []
@player[8] = Player.new
puts "@player[8].name = #{@player[8].name}"

