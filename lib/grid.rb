class Grid

  def initialize
    @cell = [ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ]
  end

  def print_grid
    print "#{@cell[1]} | #{@cell[2]} | #{@cell[3]}"
    print "------------"
  end
end

print_grid


