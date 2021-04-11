defmodule Scheduler.Availabilities do
  alias Scheduler.Availabilities.Availability
  def new(), do: %{}

  def validate(params, availavilities) do
    Availability.changeset(params, availavilities)
  end
end
