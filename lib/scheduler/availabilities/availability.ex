defmodule Scheduler.Availabilities.Availability do
  import Ecto.Changeset
  defstruct ~W/week_day from to ps/a
  @types %{week_day: :integer, from: :integer, to: :integer, ps: :string}
  def new, do: %__MODULE__{}

  def changeset(params, availabilities) do
    {new(), @types}
    |> cast(params, keys())
    |> validate_required([:ps, :week_day])
    |> validate_exclusion(:week_day, keys(availabilities), message: "you can't repeat this day")
    |> validate_length(:ps, min: 5, max: 20)
  end

  defp keys(availabilities), do: Map.keys(availabilities)
  defp keys, do: Map.keys(@types)
end
