require_relative './grid'
require_relative './player'
require_relative './console_ui'


class GameRunner
  attr_reader :turn, :is_active, :mover, :player, :grid

  def initialize(type=:human)
    @grid = Grid.new
    @player = [Player.new("X"), Player.new("O", type)]
    @turn = 0
    @is_active = true
    @mover = @player[@turn % 2]
    start_game
  end

  def start_game
    puts "\nWelcome to Tic Tac Toe!\nYou know the rules. Here's the grid.\n"
    print_color_grid
  end

  def print_color_grid
    ConsoleUI.print_color_grid(@grid.contents)
  end

  def get_move
    # This calls the get_move method in the Player class.
    @mover.get_move(@grid)
  end

  def check_tie_game
    if (@turn >= 9 && @is_active)
      print "\n**** Tie game. ***\n"
      @is_active = false
    end
  end

  def check_winner
    if (@grid.rules.who_won != nil)
      print "\n\e[#{93}m#{"\n*** Player #{@mover.designation} wins! ***\n"}\e[0m"
      @is_active = false
    end
  end

  def add_good_move(move)
    while (!@grid.add_move(@mover.designation, move) && (@grid.moves_remaining > 0))
      puts "No way, Player #{@mover.designation}. Illegal move. Try again."
      move = get_move
    end
  end

  # What happens when we take a turn? This method manages the process.
  def next_turn
    print "\nYour move, #{@mover.designation}: "
    move = get_move

    print "\nMover = #{@mover.designation}. Move = #{move}.\n"

    if move == 'Q'.to_i
      @is_active = false
      print "\n***** Game halted by user. *****\n"
      return
    end

    add_good_move(move)
    check_winner
    check_tie_game

    print_color_grid

    @turn = @turn + 1
    @mover = @player[@turn % 2]
  end
end
