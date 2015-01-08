require 'bundler'
Bundler.require(:default)

require './controllers/application_controller.rb'

Dir.glob('./{models,controllers}/*.rb').each do |file|
  require file
  puts "required #{file}"
end

require 'date'

map('/'){ run MetroController }