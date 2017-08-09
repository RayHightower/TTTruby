require 'rack'
require_relative './lib/gameweb'

use Rack::Reloader, 0 # 10 second cooldown by default. Manually changed to zero.

# Rack::Handler::WEBrick.run GameWeb.new
run GameWeb.new
