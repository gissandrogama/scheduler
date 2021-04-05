defmodule SchedulerWeb.PageLive do
  use SchedulerWeb, :live_view
  alias Scheduler.Availabilities.Availability

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket |> assign(changeset: Availability.changeset(%{}, %{}), availabilities: %{})}
  end

  @impl true
  def handle_event("insert-availability", params, socket) do
    IO.inspect(params)
    {:noreply, socket}
  end
end
