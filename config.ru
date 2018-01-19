# This file is used by Rack-based servers to start the application.

require_relative 'config/environment'

map '/GhG-Data' do
    run Rails.application
end


