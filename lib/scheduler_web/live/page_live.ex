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
    |> assign(changeset: Availabilities.validate(socket.assigns.availabilities, %{}))
  end

  defp validate(socket, availability) do
    changeset =
      socket.assigns.availabilities
      |> Availabilities.validate(availability)
      |> Map.put(:action, :validate)

      assign(socket, changeset: changeset)
  end

  defp add_availability(socket, availability) do
    if socket.assigns.changeset.valid?() do
      availabilities = socket.assigns.availabilities
      socket
      |> assign(availabilities: Availabilities.add_availability(availabilities, availability))
      |> put_flash(:info, "New Availability created!")
      |> new_changeset()
    else
      socket |> put_flash(:error, "Invalid availability to create!")
    end
  end

  @impl true
  def handle_event("create", %{"availability" => availability}, socket) do
      {:noreply, socket |> add_availability(availability)}
  end

  @impl true
  def handle_event("validate", %{"availability" => availability}, socket) do
    IO.inspect(availability)
      {:noreply, socket |> validate(availability)}
  end
end
