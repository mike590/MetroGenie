class NewYork


  def initialize(date_array, start_date, end_date, weekday_rides, weekend_rides, new_card = true)
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
    @new_card = new_card
  end

  def calculate
    @model_week.each do |day|
      if day == "Saturday" || day == "Sunday"
        @weekly_cost += @weekend_rides*2.5
      else
        @weekly_cost += @weekday_rides*2.5
      end
    end
    @weekly_cost = @weekly_cost/1.05

    @final_week.each do |day|
      if day == "Saturday" || day == "Sunday"
        @final_week_cost += @weekend_rides*2.5
      else
        @final_week_cost += @weekday_rides*2.5
      end
    end

    @final_week_cost = @final_week_cost/1.05

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

  def generate_choices
    money_on_card_cost = (@weekly_cost * @completed_weeks) + @final_week_cost
    pure_weekly_unlimited_cost = 30 * @completed_weeks
    if @final_week_length != 0
      pure_weekly_unlimited_cost += 30
    end
    hybrid_cost = (30 * @completed_weeks) + @final_week_cost
    if @new_card
      money_on_card_cost += 1
      pure_weekly_unlimited_cost += 1
      hybrid_cost += 1
    end
    # If there is no final week, two best options are pure money on card VS. all weekly unlimiteds
    if @final_week_length == 0
      choices = {
        option_1: {
          type: "flexible",
          weekly: @completed_weeks,
          value: 0,
          total_cost: pure_weekly_unlimited_cost
        },
        option_2: {
          type: "value",
          weekly: 0,
          value: money_on_card_cost,
          total_cost: money_on_card_cost
        }
      }
      return choices
    else
      # Two best options are pure money on card VS. weekly unlimiteds + money for final week
      if money_on_card_cost < pure_weekly_unlimited_cost  && hybrid_cost < pure_weekly_unlimited_cost
        choices = {
          option_1: {
            type: "value",
            weekly: 0,
            value: money_on_card_cost,
            total_cost: money_on_card_cost
          },
          option_2: {
            type: "flexible",
            weekly: @completed_weeks,
            value: @final_week_cost,
            total_cost: hybrid_cost
          }
        }
        # Two best options are pure money on card VS. all weekly unlimiteds
      elsif money_on_card_cost < hybrid_cost  && pure_weekly_unlimited_cost < hybrid_cost
        choices = {
          option_1: {
            type: "flexible",
            weekly: @completed_weeks + 1,
            value: 0,
            total_cost: pure_weekly_unlimited_cost
          },
          option_2: {
            type: "value",
            weekly: 0,
            value: money_on_card_cost,
            total_cost: money_on_card_cost
          }
        }
        # Two best options are all weekly unlimiteds VS. weekly unlimiteds + money for final week
      else
        choices = {
          option_1: {
            type: "flexible",
            weekly: @completed_weeks + 1,
            value: 0,
            total_cost: pure_weekly_unlimited_cost
          },
          option_2: {
            type: "value",
            weekly: @completed_weeks,
            value: @final_week_cost,
            total_cost: hybrid_cost
          }
        }
      end
    end
  end



end