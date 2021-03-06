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
      move_options = current_grid.empty_cell_list
      decision_scorecard = Array.new(10, -99) # Start by making all of the moves awful so that :droid won't consider them.
      lookahead = 3 # larger lookahead means greater intelligence in the AI

      # Cheat for middle: If the middle cell is empty, on the droid's 1st move the droid must grab it.
      if (move_options.count > 4 && current_grid.contents[5] == 5) then return 5 end

      move_options.each do |cell|
        fake_grid = current_grid.dupe

        # Make a fake move for the current player.
        fake_grid.add_move(self.designation, cell)

        # Explore possible responses from the opposing player.
        decision_scorecard[cell] = minimax(self.designation.flipxo, fake_grid, lookahead)
      end

      move = decision_scorecard.each_with_index.max[1] # Return the index of the cell with the maximum score.
    end

    return move
  end

  def minimax(player_designation, current_grid, lookahead_remaining)
    if (current_grid.terminal?) then # if this is a terminal node, then return the score
      terminal_score = score(player_designation, current_grid, lookahead_remaining)
      return terminal_score

    elsif (lookahead_remaining == 0) # if this is not a terminal node, but we've looked ahead far enough
      return 0

    else # if this is not a terminal node, then recurse down the tree to fill the intermediate_scorecard.
      intermediate_scorecard = [] # Start with an empty array to keep track of intermediate scores.

      other_player_designation = player_designation.flipxo # Flip the player that moves on this fake_grid.
      move_options = current_grid.empty_cell_list

      move_options.each do |fake_move| # Choose any empty cell for the next fake_move.
        deeper_grid = current_grid.dupe
        deeper_grid.add_move(player_designation, fake_move)
        intermediate_scorecard << minimax(other_player_designation, deeper_grid, lookahead_remaining-1)
      end
    end

    if player_designation == self.designation then # Are we evaluating ourselves? If so, then MAX.
      minimax_result = intermediate_scorecard.max
    elsif player_designation.flipxo == self.designation then # Are we evaluating the opponent? If so, then MIN.
      minimax_result = intermediate_scorecard.min
    end
    return minimax_result
  end

  def score(evaluated_player, grid, lookahead_remaining)
    # Given a terminal grid, did "evaluated_player" win (+10), lose (-10), or draw (0)? Return score w/greater weight placed on earlier results, less weight placed on later results.
    score = 0

    if grid.who_won == self.designation then score = 10 # (10 + 3*lookahead_remaining)
    elsif grid.who_won == self.designation.flipxo then score = -10 # (-10 - 3*lookahead_remaining)
    end
    return score
  end
end
