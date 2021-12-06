defmodule Florinda.Models.Seat do
  use Ecto.Schema

  @primary_key false
  schema "seats" do
    belongs_to :aircraft, {"aircrafts", Aircraft}, foreign_key: :aircraft_code, type: :string, primary_key: true
    field :seat_no, :string, size: 4, null: false, primary_key: true
    field :fare_conditions, :string, size: 10, null: false
  end
end
