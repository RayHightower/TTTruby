require_relative './game'

class GameRunner
  attr_accessor :game

  def initialize
    @game = Game.new
    @game.player = [Player.new("X"), Player.new("O")]

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
  def next_turn(player)
    self.print_color_grid
    move = self.get_move
    @game.add_move(player, move)

    if (thisgamerunner.game.check_winner)
        print "\e[#{93}m#{"\n*** Player #{mover.designation} wins! ***\n"}\e[0m"
        game_is_active = false
    end

    if (turn >= 9 && game_is_active)
      print "\n**** Tie game. ***\n"
      game_is_active = false
    end

    turn = turn + 1
  end
end
