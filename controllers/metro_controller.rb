class MetroController < ApplicationController

  get '/' do
    erb :index
  end

  get '/calculate' do
    date_array = (Date.parse(params[:start_date]) .. Date.parse(params[:end_date])).map do |date|
      date.dayname
    end

    start_date = Date.parse(params[:start_date])
    end_date = Date.parse(params[:end_date])
    weekday_rides = params[:weekday_rides].to_i
    weekend_rides = params[:weekend_rides].to_i
    new_card = params[:new_card]

    current_transaction = NewYork.new(date_array, start_date, end_date, weekday_rides, weekend_rides, new_card)
    current_transaction.organize
    current_transaction.calculate
    choices = current_transaction.generate_choices
    binding.pry

    content_type :json
    choices.to_json
     


  end

end