class NewYork


  def initialize(date_array, start_date, end_date, weekday_rides, weekend_rides)
    @date_array = date_array
    @start_date = start_date
    @end_date = end_date
    @weekday_rides = weekday_rides
    @weekend_rides = weekend_rides
    @final_week = []
    @completed_weeks
    @model_week = []
  end

  def calculate
    2.5*rides
  end

end