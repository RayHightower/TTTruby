require_relative './grid'

class Player

  attr_accessor :designation, :type, :name
  # :designation = "X" or "O"
  # :type = :human or :droid

  def initialize(designation, type=:human, name="Random Name")
    @designation = designation
    @type = type
  end

  def toggle(designation)    # To toggle between the two players.
    if (designation == "X") then return "O"
    elsif (designation == "O") then return "X"
    end
  end

  def get_move(current_grid)
    if self.type == :human  # Humans provide moves via the console.
      move = $stdin.getch.to_i
      return move

    elsif self.type == :droid    # Droids use minimax/AI to determine their next move.
      best_move = 0    # best_move will be determined by minimax
      scorecard = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]  # Score each of the available moves and choose the highest scoring move.
      # Start by making all of the moves neutral (0) that :droid won't consider them.

      current_player_designation = self.designation
      move_options = current_grid.empty_cell_list

      depth = 9 - move_options.count

      move_options.each do |fake_move|
        fake_grid = current_grid.dupe
        fake_grid.add_move(current_player_designation, fake_move)
        scorecard[fake_move] = minimax(current_player_designation, fake_grid, depth) # Go to the bottom of the tree.
      end

      best_move = scorecard.each_with_index.max[1]

      return best_move
    end
  end

  def minimax(current_player_designation, current_grid, depth)
    if current_grid.terminal? # if this is a terminal node, then return utility value
      then return score(current_grid, current_player_designation)

    else # if this is not a terminal node, then recurse down the tree
      deeper_grid = current_grid.dupe
      fake_move = deeper_grid.empty_cell_list.sample # Choose any empty cell for the next fake_move.
      other_player_designation = toggle(current_player_designation)
      deeper_grid.add_move(other_player_designation, fake_move)
      depth = depth + 1
      current_score = -minimax(other_player_designation, deeper_grid, depth)
      return current_score
    end
  end

  def score(grid, evaluated_player) # Given a terminal grid, did "evaluated_player" win (+99), lose (-99), or draw (0)?
    score = 0

    if grid.who_won == evaluated_player then score = 99
    elsif grid.who_won == toggle(evaluated_player) then score = -99
    end

    return score
  end
end
