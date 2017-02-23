require_relative './grid'

class Player

  attr_accessor :designation, :type, :name
  # :designation = X or O
  # :type = :human or :android
  # :name = Player's name in the real world, if they want to share it

  def initialize(designation, type=:human, name="Random Name")
    @designation = designation
    @type = type
    @name = name
  end

  def get_move(current_grid)
    if self.type == :human
      $stdin.getch.to_i  # Eventually we want to get the move from somewhere other than the console.
      return
    end

    if self.type == :droid
      minimax(self, current_grid)
    end
  end

  def minimax(current_player, current_grid)
    # Determine how many turns remain by looking at the number of empty cells.
    depth = 9 - empty_cells(current_grid)

    if depth == 9 # if this is a terminal node, then return utility value
      current_grid[1..-1].each do |cell|
        if current_grid[cell.to_i] == cell # if the cell is empty
          return cell.to_i
        end
      end
    end

    # if this is not a terminal node, then dig deeper down the tree

  end

  def empty_cells(grid)
    empty_count = 0
    grid[1..-1].each do |cell|
      if grid[cell.to_i] == cell # if the cell is empty
        empty_count +=1
      end
    end
    return empty_count
  end

  def utility(state)

  end
end
