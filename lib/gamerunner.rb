require_relative './game'

class GameRunner
  attr_accessor :game
  attr_reader :turn, :is_active

  def initialize
    @game = Game.new
    @game.player = [Player.new("X"), Player.new("O")]
    @turn = 1
    @is_active = true

    puts "\nWelcome to Tic Tac Toe!\nYou know the rules. Here's the grid.\n"
    self.print_color_grid
  end

  def get_status
    @game.get_status
  end

  def print_color_grid
    @game.print_color_grid
  end

  def get_move

  end

  # What happens when we take a turn? This method manages the process.
  def next_turn(mover)
    self.print_color_grid
    print "\nYour move, #{mover.designation}: "
    move = STDIN.getch.to_i

    @game.add_move(mover, move)

    if (self.game.check_winner)
        print "\e[#{93}m#{"\n*** Player #{mover.designation} wins! ***\n"}\e[0m"
        @is_active = false
    end

    if (@turn >= 9 && game_is_active)
      print "\n**** Tie game. ***\n"
      @is_active = false
    end

    while !self.game.add_move(mover, move)
      puts "No way, Player #{mover.designation}. Illegal move. Try again."
      move = STDIN.getch.to_i
    end

    @turn = @turn + 1
  end
end
