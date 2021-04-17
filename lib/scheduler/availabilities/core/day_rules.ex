defmodule Scheduler.Availabilities.DayRules do
  @days %{
    "0" => "Sunday",
    "1" => "Monday",
    "2" => "Tuesday",
    "3" => "Wednesday",
    "4" => "Thursday",
    "5" => "Friday",
    "6" => "Saturday"
  }
  def day_number,
    do: [Sunday: 0, Monday: 1, Tuesday: 2, Wednesday: 3, Thursday: 4, Friday: 5, Saturday: 6]

  def get_day(number), do: Map.get(@days, number)
end
