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

  # Which method is easier to manage, toggle() or flipflop?
  # I think toggle() is better because it can deal with a string without wrestling with the whole Player object.
  def flipflop
    if (self.designation == "X") then return "O"
    elsif (self.designation == "O") then return "X"
    end
  end

  def get_move(current_grid)
    if self.type == :human  # Humans provide moves via the console.
      move = $stdin.getch.to_i
      return move

    elsif self.type == :droid    # Droids use minimax/AI to determine their next move.
      best_move = 0    # best_move will be determined by minimax
      move_options = current_grid.empty_cell_list
      scorecard = [-99, -99, -99, -99, -99, -99, -99, -99, -99, -99]  # Score each of the available moves and choose the highest scoring move.
      # Start by making all of the moves so awful (-99) that :droid won't consider them.

      depth = 9 - current_grid.empty_cell_list.count

      puts "\n*** move_options = #{move_options} and depth = #{depth} ***\n"
      move_options.each do |fake_move|
        clone_grid = current_grid.clone
        # puts "\nlatest clone_grid.contents = #{clone_grid.print_color_grid}, fake_move = #{fake_move}\n"
        clone_grid.add_move(self.designation, fake_move)
        scorecard[fake_move] = minimax(self.designation, clone_grid, depth)
        puts "player = #{self.designation}, scorecard[#{fake_move}] = #{scorecard[fake_move]}, depth = #{depth}"
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
      then return score(current_grid, current_player_designation)

    else # if this is not a terminal node, then recurse down the tree
      deeper_grid = current_grid.dup
      fake_move = deeper_grid.empty_cell_list.sample # Choose any empty cell for the next fake_move.
      deeper_grid.add_move(toggle(current_player_designation), fake_move)
      depth = 9 - current_grid.empty_cell_list.count
      current_score = -minimax(toggle(current_player_designation), deeper_grid, depth)
      return current_score
    end
  end

  def score(grid, evaluated_player) # Given a terminal grid, did "evaluated_player" win (+1), lose (-1), or draw (0)?
    score = 0

    if grid.who_won == evaluated_player then score = 1
    elsif grid.who_won != nil then score = -1
    end

    return score
  end
end
