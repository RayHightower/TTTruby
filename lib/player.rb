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
    if self.type == :human  # Humans provide moves via the console.
      move = $stdin.getch.to_i
      return move

    elsif self.type == :droid    # Droids use minimax/AI to determine their next move.
      best_move = 0    # best_move for the :droid will be determined by minimax
      current_player_designation = self.designation
      move_options = current_grid.empty_cell_list
      depth = 9 - move_options.count

      # Score each of the available moves and choose the highest scoring move.
      # scorecard = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]  # Score each of the available moves and choose the highest scoring move.
      scorecard = [-999, -999, -999, -999, -999, -999, -999, -999, -999, -999]  # Start by making all of the moves awful so that :droid won't consider them.

      move_options.each do |fake_move|
        fake_grid = current_grid.dupe
        fake_grid.add_move(current_player_designation, fake_move)
        puts "\n**** BEFORE minimax: fake_move = #{fake_move}, fake_grid = #{fake_grid.contents}\nscorecard[#{fake_move}] = #{scorecard[fake_move]}, scorecard = #{scorecard}\n"
        puts "\n current_player = #{current_player_designation}." # current_grid, fake_grid below...\n"
        # current_grid.print_color_grid
        # fake_grid.print_color_grid
        scorecard[fake_move] = minimax(current_player_designation, fake_grid, depth) # Go to the bottom of the tree.
        puts "**** AFTER minimax: fake_move = #{fake_move}, fake_grid = #{fake_grid.contents}\nscorecard[#{fake_move}] = #{scorecard[fake_move]}, scorecard = #{scorecard}\n\n\n"
      end

      best_move = scorecard.each_with_index.max[1] # Should be making this choice at each level of the decision tree.

      return best_move
    end
  end

  def minimax(player_designation, current_grid, depth)
    puts "\nEntering minimax(mover = #{player_designation}, #{current_grid.contents}, depth = #{depth})\n"
    # current_grid.print_color_grid
    if current_grid.terminal? then # if this is a terminal node, then return utility value
      this_score = score(current_grid, player_designation, depth)
      puts "*** this_score = #{this_score}, depth = #{depth} ***\n"
      return this_score

    else # if this is not a terminal node, then recurse down the tree
      deeper_grid = current_grid.dupe
      deeper_move = deeper_grid.empty_cell_list.sample # Choose any empty cell for the next fake_move.
      other_player_designation = player_designation.flipxo # Flip the player that moves on this fake_grid.
      deeper_grid.add_move(other_player_designation, deeper_move)
      current_score = -minimax(other_player_designation, deeper_grid, depth+1) #RETURN the MAX or MIN of what was returned vs [what]????
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
