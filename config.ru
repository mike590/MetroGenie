require 'bundler'
Bundler.require(:default)

Dir.glob('./models/*.rb').each do |file|
  require file
  puts 'required #{file}'
end

map('/example_route'){ run ExampleController}