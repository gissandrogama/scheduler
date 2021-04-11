defmodule SchedulerWeb.PageLive do
  use SchedulerWeb, :live_view
  alias Scheduler.Availabilities

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket |> new |> new_changeset}
  end

  defp new(socket), do: socket |> assign(availabilities: Availabilities.new())

  def new_changeset(socket) do
    socket
    |> assign(changeset: Availabilities.validate(%{}, socket.assigns.availabilities))
  end

  @impl true
  def handle_event("create", %{"availability" => params}, socket) do
    params
    |> IO.inspect()
    socket.assigns.availabilities
    |> IO.inspect()
    {:noreply, socket}
  end
end
