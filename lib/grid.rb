require 'io/console'


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

# managing storage of moves
#   @cell
#   contents
#   move_at
#   add_move


class Grid

  attr_accessor :contents

  # start storage
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

  def is_cell_empty?(cell)
    return cell.to_i == cell
  end

  def dupe
    return Marshal.load(Marshal.dump(self))
  end
  # end storage

  def rules
    GameRules.new(self)
  end

  class GameRules
    def initialize(grid)
      @grid = grid
    end

    def who_won
      ["X", "O"].find { |token| has_winning_combo?(token) }
    end

    def has_winning_combo?(token)
      WINNING_COMBOS.any? { |indices| all_items_equal?(indices, token) }
    end

    def terminal?
      return (who_won != nil) || (@grid.moves_remaining < 1)
    end

    def all_items_equal?(indices, token)
      indices.map { |idx| @grid.move_at(idx) }
        .all? { |item| item == token }
    end
  end
end
