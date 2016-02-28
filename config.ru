# This file is used by Rack-based servers to start the application.

use Rack::Config do |env|
  env['api.tilt.root'] = './app/api/views'
end

require ::File.expand_path('../config/environment',  __FILE__)
run Rails.application
