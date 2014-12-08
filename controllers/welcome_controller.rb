class WelcomeController < ApplicationController

  get '/' do
    erb :index
  end

  get '/calculate' do
    date_array = (Date.parse(params[:start_date]) .. Date.parse(params[:end_date])).map do |date|
      date.dayname
    end

    start_date = Date.parse(params[:start_date])
    end_date = Date.parse(params[:end_date])
    weekday_rides = params[:weekday_rides]
    weekend_rides = params[:weekend_rides]

    current_transaction = NewYork.new(date_array, start_date, end_date, weekday_rides, weekend_rides)
    binding.pry

    content_type :json
    date_array.to_json


  end

end