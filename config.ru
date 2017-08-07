require 'rack'
require_relative './lib/gamerunner'

class TTT

  def call(env)  # To support Rack.
    @game.grid.print_color_grid
  end

end

Rack::Handler::WEBrick.run TTT.new
