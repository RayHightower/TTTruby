class Grid

  def initialize
    @cell = [ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ]
  end

  def contents
    @cell
  end

  def colorize(text, color_code)
    "\e[#{color_code}m#{text}\e[0m"
  end

  def print_grid
    print "\n #{@cell[1]} | #{@cell[2]} | #{@cell[3]}"
    print "\n-----------\n"
    print " #{@cell[4]} | #{@cell[5]} | #{@cell[6]}"
    print "\n-----------\n"
    print " #{@cell[7]} | #{@cell[8]} | #{@cell[9]}"
    print "\n"
  end

  def print_color_grid
    print "\n"
    for location in 1..9 do
      print " "
      if @cell[location] == "X" then print colorize("X", 31)
      elsif @cell[location] == "O" then print colorize("O", 34)
      else print location
      end
      print " "

      if (location % 3 == 0 && location % 9 != 0) then print "\n-----------\n" 
      elsif (location % 9 != 0) then print "|"
      end
    end
    print "\n"
  end

  def add_move(designation, location)
    if ((location < 1) || (location > 9))
      return false
    end

    if @cell[location] != location  # if this cell is empty
      return false # because the cell is already occupied
    end

    @cell[location] = designation
    return true # because we successfully added the move
  end

end


