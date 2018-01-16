require_relative './colorizer'

WINNING_COMBOS = [
  [1, 2, 3],
  [4, 5, 6],
  [7, 8, 9],
  [1, 4, 7],
  [2, 5, 8],
  [3, 6, 9],
  [1, 5, 9],
  [3, 5, 7]
]

class Grid
  include Colorizer # A module for color!

  attr_accessor :contents

  def initialize
    @cell = [ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ]
  end

  def contents
    @cell
  end

  def move_at(space)
    if contents[space].is_a?(String)
      return contents[space]
    end

    return nil
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
    return self.empty_cell_list.size
  end

  def empty_cell_list
    return @cell[1..-1].select { |cell| is_cell_empty?(cell) }
  end

  def terminal? # A grid can look at itself and know that it's terminal, ie there are no legal moves left on the grid.
    return (who_won != nil) || (moves_remaining <1)
  end

  def is_cell_empty?(cell)
    return cell.to_i == cell
  end

  def dupe
    return Marshal.load(Marshal.dump(self))
  end

  # what needs to be done to get rid of this implementation?
  # RTH: Remove all code that calls grid.who_won, and call game.who_won instead.
  # RTH: Alternate solution: Implement who_won in Grid because... (see Gist).
  #
  # terminal? needs to move
  # RTH: No. It stays here.
  #
  # remove specs from grid (because we have them on game now)
  # RTH: Alternate: Remove specs from Game because we have them on Grid now.
  #
  # any other usages of who_won on grid inside the codebase?

  def who_won # A grid can look at itself and see who won.
    ["X", "O"].find { |token| has_winning_combo?(token) }
  end

  def has_winning_combo?(token)
    WINNING_COMBOS.any? { |indices| all_items_equal?(indices, token) }
  end

  def all_items_equal?(indices, token)
    indices.map { |idx| self.move_at(idx) }
      .all? { |item| item == token }
  end

end
