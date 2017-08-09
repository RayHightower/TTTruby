require_relative './gamerunner'

class GameWeb

  def call(env)  # To support Rack.
    # @gamerunner = GameRunner.new
    # Rack::Response.new("#{@gamerunner.game.grid.print_color_grid}")
    Rack::Response.new("Hello World!")
    # [200, {"Content-Type" => "text/plain"}, ["Hello World!"]]
  end

end
