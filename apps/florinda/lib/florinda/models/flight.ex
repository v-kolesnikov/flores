defmodule Florinda.Models.Flight do
  use Ecto.Schema

  @primary_key {:flight_id, :id, []}
  schema "flights" do
    field :flight_no, :string, size: 6, null: false
    field :scheduled_departure, :naive_datetime, null: false
    field :scheduled_arrival, :naive_datetime, null: false

    belongs_to :departure, {"airports", Airport}, foreign_key: :departure_airport, type: :string
    belongs_to :arrival, {"airports", Airport}, foreign_key: :arrival_airport, type: :string

    field :status, :string, size: 20, null: false

    belongs_to :aircraft, {"aircrafts", Aircraft}, foreign_key: :aircraft_code, type: :string

    field :actual_departure, :naive_datetime
    field :actual_arrival, :naive_datetime
  end
end
