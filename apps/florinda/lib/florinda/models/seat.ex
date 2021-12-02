defmodule Florinda.Models.Seat do
  use Ecto.Schema

  # TODO: Actual PK is [aircraft_code, seat_no]. How to define this?
  @primary_key false
  schema "seats" do
    belongs_to :aircraft, {"aircrafts", Aircraft}, foreign_key: :aircraft_code, type: :string
    field :seat_no, :string, size: 4, null: false
    field :fare_conditions, :string, size: 10, null: false
  end
end
