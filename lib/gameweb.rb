require_relative './gamerunner'

class GameWeb

  def call(env)  # To support Rack.
    @gamerunner = GameRunner.new
    # Rack::Response.new("#{@gamerunner.game.grid.print_color_grid}")
    Rack::Response.new("Hello World!")
  end

end
