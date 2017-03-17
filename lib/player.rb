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

  def toggle(designation)
    if (designation == "X") then return "O"
    elsif (designation == "O") then return "X"
    end
  end

  def minimax(current_player, current_grid, depth)
    best_score = 0        # Might need to live in get_move?
    best_move = 0         # Might need to live in get_move?
    other_player = "Z"    # Might need to live in get_move?

    # minimax should only return scores?

    player_toggle = [self.designation, other_player]

    # puts "\n\n***** current_grid.moves_remaining  = #{current_grid.moves_remaining} ******\n\n"

    if current_grid.moves_remaining == 1 # if this is a terminal node, then return utility value
      then return current_grid.empty_cell_list
    else # if this is not a terminal node, then dig deeper down the tree
      # deeper_grid = current_grid.dup
      # score = minimax(player_toggle(turn % 2), deeper_grid)
      random_legal_move = current_grid.empty_cell_list.sample
      puts "empty_cell_list = #{current_grid.empty_cell_list}"
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
