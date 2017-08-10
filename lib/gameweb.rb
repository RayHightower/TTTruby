require_relative './gamerunner'
require "erb"

class Gameweb

  def call(env)  # To support Rack.
    request = Rack::Request.new(env)
    # request.path # = the URL path that the user typed in to access this page
    Rack::Response.new("#{request.path}")
    sleep 5
    Rack::Response.new("Hello Everybody!!!!!!!")
    sleep 5
    Rack::Response.new(render("currentboard.html.erb"))
  end

  def render(template)
    path = File.expand_path("../views/#{template}", __FILE__)
    ERB.new(File.read(path)).result(binding)
  end
end
