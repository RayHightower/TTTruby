require_relative './player'
require_relative './grid'

class ArtificialPlayer<Player

  def get_move
    1
  end

  def minimax(current_grid)

    # if this is a terminal node, then return utility value
    current_grid[1..-1].each do |cell|
      if current_grid[cell.to_i] == cell # if the cell is empty
        return cell.to_i
      end
    end

    # if this is not a terminal node, then dig deeper down the tree

  end

  def utility(state)

  end


end
