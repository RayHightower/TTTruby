require 'rack'
require_relative './lib/gameweb'

use Rack::Reloader

Rack::Handler::WEBrick.run GameWeb.new
