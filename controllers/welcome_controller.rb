class WelcomeController < ApplicationController

  get '/' do
    erb :index
  end

  get '/calculate' do
    date_array = (Date.parse(params[:start_date]) .. Date.parse(params[:end_date])).map do |date|
      date.dayname
    end

    content_type :json
    date_array.to_json

  end

end