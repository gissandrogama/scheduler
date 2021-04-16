defmodule Scheduler.Availabilities do
  alias Scheduler.Availabilities.Availability
  def new(), do: %{}

  def validate(availabilities, params) do
    Availability.changeset(availabilities, params)
  end

  def add_availability(availabilities, availability) do
    availabilities |>  Map.put(availability["week_day"], availability)
  end
end
