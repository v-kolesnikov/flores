defmodule Florinda.Models.Flight do
  use Ecto.Schema

  alias Florinda.Models

  @primary_key {:flight_id, :id, []}
  schema "flights" do
    field :flight_no, :string, size: 6, null: false
    field :scheduled_departure, :naive_datetime, null: false
    field :scheduled_arrival, :naive_datetime, null: false

    belongs_to :departure, {"airports", Models.Airport}, foreign_key: :departure_airport, type: :string
    belongs_to :arrival, {"airports", Models.Airport}, foreign_key: :arrival_airport, type: :string

    field :status, :string, size: 20, null: false

    belongs_to :aircraft, {"aircrafts", Models.Aircraft}, foreign_key: :aircraft_code, type: :string

    field :actual_departure, :naive_datetime
    field :actual_arrival, :naive_datetime

    many_to_many :tickets, Models.Ticket, join_through: "ticket_flights", join_keys: [flight_id: :flight_id, ticket_no: :ticket_no]
  end
end
