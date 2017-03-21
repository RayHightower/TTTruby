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
    best_score = 0        # Might need to live in get_move?
    best_move = 0         # Might need to live in get_move?

    if self.type == :human
      move = $stdin.getch.to_i  # Humans provide moves via the console.
      return move
    elsif self.type == :droid    # Droids use minimax/AI to determine their next move.
      depth = 9 - current_grid.moves_remaining
      best_move = minimax(self, current_grid, depth)
      return best_move
    end
  end

  def toggle(designation)
    if (designation == "X") then return "O"
    elsif (designation == "O") then return "X"
    end
  end

  def minimax(current_player, current_grid, depth)
    if current_grid.terminal? # if this is a terminal node, then return utility value
      then return score(current_grid)
    else # if this is not a terminal node, then dig deeper down the tree
      # deeper_grid = current_grid.dup
      # score = minimax(player_toggle(turn % 2), deeper_grid)
      random_legal_move = current_grid.empty_cell_list.sample
      puts "\nempty_cell_list = #{current_grid.empty_cell_list}\n"
      return random_legal_move
    end
  end

  def score(grid) # Given a terminal grid, did I win (+1), lose (-1), or draw (0)?
    score = 0

    if grid.who_won == self.designation then score = 1
    elsif grid.who_won != nil then score = -1
    end

    return score
  end
end
