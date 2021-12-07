defmodule Florinda.Models.Ticket do
  use Ecto.Schema

  alias Florinda.Models

  @primary_key {:ticket_no, :string, []}
  schema "tickets" do
    belongs_to :booking, {"bookings", Models.Booking},
      references: :book_ref,
      foreign_key: :book_ref,
      type: :string
    field :passenger_id, :string, size: 20, null: false
    field :passenger_name, :string, null: false
    field :contact_data, :map

    many_to_many :flights, Models.Flight,
      join_through: "ticket_flights",
      join_keys: [ticket_no: :ticket_no, flight_id: :flight_id]
  end
end
