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
    @weekly_cost = 0
    @final_week_cost = 0
  end

  def calculate
    @model_week.each do |day|
      if day == "Saturday" || day == "Sunday"
        @weekly_cost += @weekend_rides*2.5
      else
        @weekly_cost += @weekday_rides*2.5
      end
    end

    @final_week.each do |day|
      if day == "Saturday" || day == "Sunday"
        @final_week_cost += @weekend_rides*2.5
      else
        @final_week_cost += @weekday_rides*2.5
      end
    end
  end

  def organize
    final_week_length = @date_array.length % 7
    final_week_length.times do
      @final_week.push(@date_array.pop)
    end
    @final_week.reverse!

    @completed_weeks = (@date_array.length)/7

    if @date_array.length != 0
      7.times do
        @model_week.push(@date_array.pop)
      end
    end

  end

end