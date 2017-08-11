require_relative './gamerunner'
require "erb"

class Gameweb

  def initialize
    @gamerunner = GameRunner.new
    @gridcontents = @gamerunner.game.grid.contents
  end

  def call(env)  # To support Rack.
    request = Rack::Request.new(env)
    # request.path # = the URL path that the user typed in to access this page
    Rack::Response.new("#{request.path}")
    Rack::Response.new(render("gameweb.html.erb"))
  end

  def render(template)
    path = File.expand_path("../views/#{template}", __FILE__)
    ERB.new(File.read(path)).result(binding)
  end
end
