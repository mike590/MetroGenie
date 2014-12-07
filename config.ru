require 'bundler'
Bundler.require(:default)

Dir.glob('./{models,controllers}/*.rb').each do |file|
  require file
  puts 'required #{file}'
end

require 'date'

map('/'){ run WelcomeController }