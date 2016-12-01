class Grid

  def initialize
    @cell = [ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ]
  end

  def contents
    @cell
  end

  def print_grid
    print " #{@cell[1]} | #{@cell[2]} | #{@cell[3]}"
    print "\n-----------\n"
    print " #{@cell[4]} | #{@cell[5]} | #{@cell[6]}"
    print "\n-----------\n"
    print " #{@cell[7]} | #{@cell[8]} | #{@cell[9]}"
    print "\n"
  end
end
