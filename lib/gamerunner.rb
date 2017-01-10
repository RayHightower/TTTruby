require_relative './game'

class GameRunner
  attr_accessor :game
  attr_reader :turn, :is_active, :mover

  def initialize
    @game = Game.new
    @game.player = [Player.new("X"), Player.new("O")]
    @turn = 1
    @is_active = true
    @mover = @game.player[@turn % 2]

    puts "\nWelcome to Tic Tac Toe!\nYou know the rules. Here's the grid.\n"
    @game.print_color_grid
  end

  def get_status
    @game.get_status
  end

  def print_color_grid
    @game.print_color_grid
  end

  def get_move
    STDIN.getch.to_i  # Eventually we want to get the move from somewhere other than the console.
  end

  def check_tie_game
    if (@turn >= 9 && @is_active)
      print "\n**** Tie game. ***\n"
      @game.print_color_grid
      @is_active = false
    end
  end

  def check_winner
    if (@game.check_winner)
      @game.print_color_grid
      print "\n\e[#{93}m#{"\n*** Player #{@mover.designation} wins! ***\n"}\e[0m"
      @is_active = false
    end
  end

  # What happens when we take a turn? This method manages the process.
  def next_turn
    print "\nYour move, #{@mover.designation}: "
    move = get_move

    while !@game.add_move(@mover, move)
      puts "No way, Player #{@mover.designation}. Illegal move. Try again."
      move = get_move
    end

    check_winner
    check_tie_game

    print_color_grid
    @turn = @turn + 1
    @mover = @game.player[@turn % 2]
  end
end
