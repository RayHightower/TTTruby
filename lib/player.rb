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
        # fake_grid = current_grid.dupe
        # fake_grid.add_move(self.designation, cell)
        puts "\n\n*** Calling minimax for #{self.designation}, move_options = #{move_options}, cell = #{cell}.\n"
        decision_scorecard[cell] = minimax(self.designation, fake_grid, lookahead)
        puts "decision_scorecard[#{cell}] = #{decision_scorecard[cell]}"
      end

      move = decision_scorecard.each_with_index.max[1]
      puts "get_move move = #{move}, decision_scorecard = #{decision_scorecard}\n\n"
    end

    return move
  end

  def minimax(player_designation, current_grid, lookahead_remaining)
    if (current_grid.terminal?) then # if this is a terminal node, then return the score
      terminal_score = score(current_grid, player_designation, lookahead_remaining)
      puts "\n2. *** returning TERMINAL player #{player_designation}, terminal_score = #{terminal_score}, terminal? = #{current_grid.terminal?}, lookahead_remaining = #{lookahead_remaining}, who_won = #{current_grid.who_won} ***\n"
      return terminal_score

    elsif (lookahead_remaining == 0) # if this is not a terminal node, but we've looked ahead far enough
      return 0

    else # if this is not a terminal node, then recurse down the tree to fill the intermediate_scorecard.
      intermediate_scorecard = Array.new(10, 0)
      other_player_designation = player_designation.flipxo # Flip the player that moves on this fake_grid.
      move_options = current_grid.empty_cell_list

      move_options.each do |fake_move| # Choose any empty cell for the next fake_move.
        deeper_grid = current_grid.dupe
        deeper_grid.add_move(other_player_designation, fake_move)
        # puts "\nBefore scoring: Next move to be made by #{other_player_designation}, fake_move = #{fake_move}\n"
        intermediate_scorecard[fake_move] = -minimax(other_player_designation, deeper_grid, lookahead_remaining-1)
      end
    end

    if player_designation = self.designation then
      max_calculation = intermediate_scorecard.max
      puts "3.MAX returning max_calculation = #{max_calculation}, MINIMAX player #{self.designation}, intermediate_scorecard = #{intermediate_scorecard}"
      return max_calculation
    elsif player_designation.flipxo = self.designation then
      min_calculation = intermediate_scorecard.min
      puts "4.MIN returning min_calculation = #{min_calculation}, MINIMAX player #{self.designation}, intermediate_scorecard = #{intermediate_scorecard}"
      return min_calculation
    end

  end

  def score(grid, evaluated_player, lookahead_remaining)
    # Given a terminal grid, did "evaluated_player" win (+10), lose (-10), or draw (0)? Return score w/greater weight placed on earlier results, less weight placed on later results.
    score = 0

    if grid.who_won == self.designation then score = (10 + 3*lookahead_remaining)
    elsif grid.who_won == self.designation.flipxo then score = (-10 - 3*lookahead_remaining)
    end
    puts "1. returning score = #{score}, evaluated_player = #{evaluated_player}, self = #{self.designation}"
    return score
  end
end
