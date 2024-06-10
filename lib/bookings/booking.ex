defmodule Flightex.Bookings.Booking do
  alias Flightex.Bookings.Booking

  @keys [:complete_date, :local_origin, :local_destination, :user_id, :id]
  @enforce_keys @keys
  defstruct @keys

  def build(complete_date, local_origin, local_destination, user_id ) do
    id = UUID.uuid4()

    {:ok,
      %Booking{
        id: id,
        complete_date: complete_date,
        local_origin: local_origin,
        local_destination: local_destination,
        user_id: user_id
      }
    }
  end
end
