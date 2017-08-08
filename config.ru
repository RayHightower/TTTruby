require 'rack'
require_relative './lib/gamerunner'

class TTT

  def call(env)  # To support Rack.
    @gamerunner = GameRunner.new
    [200, {"Content-Type" => "text/plain"}, ["#{@gamerunner.game.grid.print_color_grid}"]]
  end

end

Rack::Handler::WEBrick.run TTT.new
