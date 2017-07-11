require_relative './grid'

class String
  def flipxo # Monkey patch the string class so we can flip designations without passing the whole Player object. Performance!
    if (self == "X") then return "O"
    elsif (self == "O") then return "X"
    end
    return "Invalid"
  end
end

class Player
  attr_accessor :designation, :type, :name
  # :designation = "X" or "O"
  # :type = :human or :droid

  def initialize(designation, type=:human, name="Random Name")
    @designation = designation
    @type = type
  end

  def get_move(current_grid)
    if self.type == :human  # Human provides a move via the console.
      move = $stdin.getch.to_i
    elsif self.type == :droid    # Droid uses minimax/AI to determine its next move.
      lookahead = 3 # larger lookahed means greater intelligence in the AI
      move = minimax(self.designation, current_grid, lookahead) # scorecard.each_with_index.max[1] # Should be making this choice at each level of the decision tree.
    end

    return move
  end

  def minimax(player_designation, current_grid, lookahead)
    best_move = 0    # best_move for the :droid will be determined by minimax
    if (current_grid.terminal? || lookahead == 0) then # if this is a terminal node, then return utility value
      this_score = score(current_grid, player_designation, depth)
      puts "*** this_score = #{this_score}, depth = #{depth} ***\n"
      return this_score

    else # if this is not a terminal node, then recurse down the tree
      deeper_grid = current_grid.dupe
      deeper_move = deeper_grid.empty_cell_list.sample # Choose any empty cell for the next fake_move.
      other_player_designation = player_designation.flipxo # Flip the player that moves on this fake_grid.
      deeper_grid.add_move(other_player_designation, deeper_move)
      current_score = -minimax(other_player_designation, deeper_grid, lookahead-1) #RETURN the MAX or MIN of what was returned vs [what]????
      return current_score
    end
  end

  def score(grid, evaluated_player, depth) # Given a terminal grid, did "evaluated_player" win (+99), lose (-99), or draw (0)?
    score = 0

    if grid.who_won == evaluated_player then score = 999
    elsif grid.who_won == evaluated_player.flipxo then score = -999
    end

    score = score/depth

    return score
  end
end
