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
      # Start by making all of the moves awful so that :droid won't consider them.
      scorecard = Array.new(10, -10)
      lookahead = 3 # larger lookahead means greater intelligence in the AI
      move_options.each do |cell|
        fake_grid = current_grid.dupe
        fake_grid.add_move(self.designation, cell)
        puts "\n\n*** Calling minimax for #{self.designation}, move_options = #{move_options}, cell = #{cell}.\n"
        scorecard[cell] = minimax(self.designation, fake_grid, lookahead) # scorecard.each_with_index.max[1]
      end
      puts "\nscorecard = #{scorecard}"
      move = scorecard.each_with_index.max[1]
    end

    return move
  end

  def minimax(player_designation, current_grid, lookahead_remaining)
    if (current_grid.terminal? || lookahead_remaining == 0) then # if this is a terminal node, then return the score
      this_score = score(current_grid, player_designation, lookahead_remaining)
      puts "*** this_score = #{this_score}, current_grid.terminal? = #{current_grid.terminal?}, lookahead_remaining = #{lookahead_remaining} ***\n"
      return this_score

    else # if this is not a terminal node, then recurse down the tree to fill the scorecard.
      scorecard = Array.new(10, -10)
      deeper_grid = current_grid.dupe
      deeper_move = deeper_grid.empty_cell_list.sample # Choose any empty cell for the next fake_move.
      other_player_designation = player_designation.flipxo # Flip the player that moves on this fake_grid.
      deeper_grid.add_move(other_player_designation, deeper_move)
      puts "\nBefore scoring: Next move to be made by #{other_player_designation}, deeper_move = #{deeper_move}\n"
      #RETURN the MAX or MIN of what was returned vs [what]????
      scorecard[deeper_move] = -minimax(other_player_designation, deeper_grid, lookahead_remaining-1)
    end

    max_score = scorecard.each_with_index.max[1]
    min_score = scorecard.each_with_index.min[1]

    if player_designation = self.designation then return max_score
    elsif player_designation.flipxo = self.designation then return min_score
    end

  end

  def score(grid, evaluated_player, lookahead_remaining)
    # Given a terminal grid, did "evaluated_player" win (+10), lose (-10), or draw (0)?
    # Return score w/greater weight placed on earlier results, less weight placed on later results.
    score = 0

    if grid.who_won == evaluated_player then score = 10
    elsif grid.who_won == evaluated_player.flipxo then score = -10
    end

    return score
  end
end
