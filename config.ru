require 'rack'
require_relative 'gamerunner'

class TTT

  def call(env)  # To support Rack.
    print_color_grid
  end

end
