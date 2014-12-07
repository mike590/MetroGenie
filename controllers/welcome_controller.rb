class WelcomeController < ApplicationController

  get '/' do
    erb :index
  end

  post '/calculate' do
  
    
      date_Array = (Date.parse(params[:start_date]) .. Date.parse(params[:end_date])).map do |date|
        date.dayname
      end
    binding.pry
  end

end