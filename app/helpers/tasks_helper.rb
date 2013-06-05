module TasksHelper
  def get_next_day(param)
    date = param ? param.to_date : Date.today
    date + 1.day
  rescue ArgumentError
    Date.today + 1.day
  end

  def get_previous_day(param)
    date = param ? param.to_date : Date.today
    date - 1.day
  rescue ArgumentError
    Date.today - 1.day
  end
end
