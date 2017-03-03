require_relative './grid'

class Player

  attr_accessor :designation, :type, :name
  # :designation = X or O
  # :type = :human or :droid

  def initialize(designation, type=:human, name="Random Name")
    @designation = designation
    @type = type
  end

  def get_move(current_grid)
    if self.type == :human
      move = $stdin.getch.to_i  # Humans provide moves via the console.
      return move
    elsif self.type == :droid    # Droids use minimax/AI to determine their next move.
      depth = 9 - current_grid.moves_remaining
      move = minimax(self, current_grid, depth)
      return move
    end
  end

  def minimax(current_player, current_grid, depth)
    best_score = 0
    best_move = 0
    not_self = "Z"

    # return 5

    player_toggle = [self.designation, not_self]

    puts "\n\n***** current_grid.moves_remaining  = #{current_grid.moves_remaining} ******\n\n"

    if current_grid.moves_remaining == 1 # if this is a terminal node, then return utility value
      current_grid.contents[1..-1].each do |cell|
        if current_grid.contents[cell.to_i] == cell # if the cell is empty
          return cell.to_i
        end
      end
    else # if this is not a terminal node, then dig deeper down the tree
      # deeper_grid = current_grid.dup
      # score = minimax(player_toggle(turn % 2), deeper_grid)
      return 5
    end
  end

  def score(grid) # Given a grid, did I win (+1), lose (-1), or draw (0)?
    1
  end
end
