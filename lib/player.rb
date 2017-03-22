require_relative './grid'

class Player

  attr_accessor :designation, :type, :name
  # :designation = "X" or "O"
  # :type = :human or :droid

  def initialize(designation, type=:human, name="Random Name")
    @designation = designation
    @type = type
  end

  def get_move(current_grid)
    best_move = 0    # best_move as determined by minimax
    move_options = current_grid.empty_cell_list
    scores = []

    if self.type == :human
      move = $stdin.getch.to_i  # Humans provide moves via the console.
      return move
    elsif self.type == :droid    # Droids use minimax/AI to determine their next move.
      depth = 9 - current_grid.empty_cell_list.count

      move_options.each do |move_option|
        scores[move_option] = 1 # minimax(self.designation, current_grid, depth)
        puts "\nscores[#{move_option}] = #{scores[move_option]} and depth = #{depth}\n"
      end

      # best_move = minimax(self, current_grid, depth)
      best_move = scores.each_with_index.max[1]
      puts "\nbest_move = [#{scores.each_with_index.max[1]}]\n"
      return best_move
    end
  end

  def toggle(designation)
    if (designation == "X") then return "O"
    elsif (designation == "O") then return "X"
    end
  end

  def minimax(current_player_designation, current_grid, depth)
    if current_grid.terminal? # if this is a terminal node, then return utility value
      then return score(current_grid)
    else # if this is not a terminal node, then dig deeper down the tree
      deeper_grid = current_grid.dup
      fake_move = deeper_grid.empty_cell_list.sample
      deeper_grid.add_move(current_player_designation, fake_move)
      depth = 9 - current_grid.empty_cell_list.count
      current_score = -minimax(toggle(current_player_designation), deeper_grid, depth)
      return current_score
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
