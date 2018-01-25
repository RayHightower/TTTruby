require_relative './colorizer'

class ConsoleUI
  extend Colorizer # A module for color!

  BLUE = 31
  RED = 34

  def self.print_color_grid(grid)
    print "\n"
    for location in 1..9 do
      print " "
      if grid[location] == "X" then print colorize("X", BLUE)
      elsif grid[location] == "O" then print colorize("O", RED)
      else print location
      end
      print " "

      if is_internal_line?(location)
        print "\n-----------\n"
      elsif not_last_line?(location)
        print "|"
      end
    end

    print "\n"
  end

  def self.is_internal_line?(location)
    location % 3 == 0 && location % 9 != 0
  end

  def self.not_last_line?(location)
    location % 9 != 0
  end
end
