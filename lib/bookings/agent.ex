defmodule Flightex.Bookings.Agent do
  use Agent

  alias Flightex.Bookings.Booking

  def start_link(_initial_state) do
    Agent.start_link(fn -> %{} end, name: __MODULE__)
  end

  def save(%Booking{} = booking) do
    uuid = booking.id

    {Agent.update(__MODULE__, &update_booking(&1, booking, uuid)), uuid}
  end

  def get(id) do
    Agent.get(__MODULE__, &get_booking(&1, id))
  end

  defp update_booking(state, booking, uuid) do
    Map.put(state, uuid, booking)
  end

  defp get_booking(state, id) do
    case Map.get(state, id) do
      nil -> {:error, "Booking not found"}
      booking -> {:ok, booking}
    end
  end
end
