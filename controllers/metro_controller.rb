class MetroController < ApplicationController

  get '/' do
    erb :index
  end

  get '/calculate' do
    start_date_arr = params[:start_date].split("/")
    start_date = start_date_arr[2] + "-" + start_date_arr[0] + "-" + start_date_arr[1]
    end_date_arr = params[:end_date].split("/")
    end_date = end_date_arr[2] + "-" + end_date_arr[0] + "-" + end_date_arr[1]
    date_array = (Date.parse(start_date) .. Date.parse(end_date)).map do |date|
      date.dayname
    end

    weekday_rides = params[:weekday_rides].to_i
    weekend_rides = params[:weekend_rides].to_i
    new_card = params[:new_card]
    if new_card == "true"
      new_card = true
    else
      new_card = false
    end

    current_transaction = NewYork.new(date_array, start_date, end_date, weekday_rides, weekend_rides, new_card)
    current_transaction.organize
    current_transaction.calculate
    choices = current_transaction.generate_choices

    best_choice = current_transaction.best_choice(choices)

    content_type :json
    best_choice.to_json



  end

end