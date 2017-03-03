require_relative './colorizer'

class Grid
  include Colorizer # A module for color!

  attr_accessor :contents

  def initialize
    @cell = [ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ]
    # @cell = [ 0, "O", 2, 3, 4, "X", 6, 7, "X", 9 ]
  end

  def contents
    @cell
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

    if @cell[location] != location  # if this is already occupied
      return false
    end

    @cell[location] = designation
    return true # because the move is legal and we added it
  end

  def moves_remaining
    empty_count = 0
    self.contents[1..-1].each do |cell|
      if self.contents[cell.to_i] == cell # if the cell is empty
        empty_count +=1 # count one more
      end
    end
    return empty_count
  end

  def empty_cell_list
    empty_cells = []
    self.contents[1..-1].each do |cell|
      if self.contents[cell.to_i] == cell # if the cell is empty
        empty_cells << cell  # add its designation to the list
      end
    end
    return empty_cells
  end

  def who_won   # A grid can look at itself and see who won.
    winner = nil

    (self.contents[1] == "O" && self.contents[1] == self.contents[2] && self.contents[2] == self.contents[3]) ? winner = "O" : nil
    (self.contents[4] == "O" && self.contents[4] == self.contents[5] && self.contents[5] == self.contents[6]) ? winner = "O" : nil
    (self.contents[7] == "O" && self.contents[7] == self.contents[8] && self.contents[8] == self.contents[9]) ? winner = "O" : nil

    (self.contents[1] == "O" && self.contents[1] == self.contents[4] && self.contents[4] == self.contents[7]) ? winner = "O" : nil
    (self.contents[2] == "O" && self.contents[2] == self.contents[5] && self.contents[5] == self.contents[8]) ? winner = "O" : nil
    (self.contents[3] == "O" && self.contents[3] == self.contents[6] && self.contents[6] == self.contents[9]) ? winner = "O" : nil

    (self.contents[1] == "O" && self.contents[1] == self.contents[5] && self.contents[5] == self.contents[9]) ? winner = "O" : nil
    (self.contents[3] == "O" && self.contents[3] == self.contents[5] && self.contents[5] == self.contents[7]) ? winner = "O" : nil

    (self.contents[1] == "X" && self.contents[1] == self.contents[2] && self.contents[2] == self.contents[3]) ? winner = "X" : nil
    (self.contents[4] == "X" && self.contents[4] == self.contents[5] && self.contents[5] == self.contents[6]) ? winner = "X" : nil
    (self.contents[7] == "X" && self.contents[7] == self.contents[8] && self.contents[8] == self.contents[9]) ? winner = "X" : nil

    (self.contents[1] == "X" && self.contents[1] == self.contents[4] && self.contents[4] == self.contents[7]) ? winner = "X" : nil
    (self.contents[2] == "X" && self.contents[2] == self.contents[5] && self.contents[5] == self.contents[8]) ? winner = "X" : nil
    (self.contents[3] == "X" && self.contents[3] == self.contents[6] && self.contents[6] == self.contents[9]) ? winner = "X" : nil

    (self.contents[1] == "X" && self.contents[1] == self.contents[5] && self.contents[5] == self.contents[9]) ? winner = "X" : nil
    (self.contents[3] == "X" && self.contents[3] == self.contents[5] && self.contents[5] == self.contents[7]) ? winner = "X" : nil

    return winner
  end
end
