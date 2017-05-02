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
      scorecard = [-99, -99, -99, -99, -99, -99, -99, -99, -99, -99]  # Score each of the available moves and choose the highest scoring move.
      # Start by making all of the moves so awful (-99) that :droid won't consider them.

      current_player_designation = self.designation
      move_options = current_grid.empty_cell_list

      depth = 9 - current_grid.empty_cell_list.count

      puts "\n*** Starting the move_options loop. move_options = #{move_options} and depth = #{depth} ***"
      move_options.each do |fake_move|
        fake_grid = Marshal.load(Marshal.dump(current_grid))
        fake_grid.add_move(current_player_designation, fake_move)
        scorecard[fake_move] = minimax(current_player_designation, fake_grid, depth)  # Go to the bottom of the tree.
        puts "\ncurrent_player_designation = #{current_player_designation}, toggle(current_player_designation) = #{toggle(current_player_designation)}\n"
        puts "scorecard[#{fake_move}] = #{scorecard[fake_move]}, scorecard = #{scorecard}, depth = #{depth}"
        puts "latest fake_grid.contents = #{fake_grid.contents}, fake_move = #{fake_move}, self.designation = #{self.designation}\n"

        fake_grid.print_color_grid # remove this when the algorithm works!
        puts "\n"
      end

      # puts "get_move: scorecard = #{scorecard}, player = #{self.designation}, current_grid.contents = #{current_grid.print_color_grid}\n"
      puts "get_move: scorecard = #{scorecard}"
      best_move = scorecard.each_with_index.max[1]
      puts "get_move: best_move = #{best_move}\n"
      return best_move
    end
  end

  def minimax(current_player_designation, current_grid, depth)
    if current_grid.terminal? # if this is a terminal node, then return utility value
      then return score(current_grid, current_player_designation, depth)

    else # if this is not a terminal node, then recurse down the tree
      deeper_grid = Marshal.load(Marshal.dump(current_grid))
      fake_move = deeper_grid.empty_cell_list.sample # Choose any empty cell for the next fake_move.
      other_player_designation = toggle(current_player_designation)
      deeper_grid.add_move(other_player_designation, fake_move)
      depth = depth + 1
      puts "MINIMAX method. deeper_grid = #{deeper_grid.contents}, depth = #{depth}"
      current_score = -minimax(other_player_designation, deeper_grid, depth)
      return current_score
    end
  end

  def score(grid, evaluated_player, depth) # Given a terminal grid, did "evaluated_player" win (+1), lose (-1), or draw (0)?
    score = 0

    if grid.who_won == evaluated_player then score = 99
    elsif grid.who_won != toggle(evaluated_player) then score = -99
    end

    puts "\nSCORE method: scoring for evaluated_player = #{evaluated_player}\ngrid.contents = #{grid.contents}, score = #{score}, depth = #{depth}\n\n"
    return score
  end
end
