defmodule Scheduler.Availabilities do
  alias Scheduler.Availabilities.Availability
  alias Scheduler.Availabilities.DayRules
  def new(), do: %{}

  def validate(availabilities, params) do
    Availability.changeset(availabilities, params)
  end

  def week_day_list, do: DayRules.day_number()
  def get_day(number), do: DayRules.get_day(number)

  def add_availability(availabilities, availability) do
    availabilities |> Map.put(availability["week_day"], availability)
  end
end
