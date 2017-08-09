require_relative './gamerunner'
require "erb"

class GameWeb

  def call(env)  # To support Rack.
    # @gamerunner = GameRunner.new
    # Rack::Response.new("#{@gamerunner.game.grid.print_color_grid}")
    # Rack::Response.new("Hello World!")
    Rack::Response.new(render("currentboard.html.erb"))
    # [200, {"Content-Type" => "text/plain"}, ["Hello World!"]]
  end

  def render(template)
    path = File.expand_path("../views/#{template}", __FILE__)
    ERB.new(File.read(path)).result(binding)
  end

end
