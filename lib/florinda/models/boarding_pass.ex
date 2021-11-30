defmodule Florinda.Models.BoardingPass do
  use Ecto.Schema

  @primary_key false
  schema "boarding_passes" do
    field :ticket_no, :string, size: 13, null: false, primary_key: true
    field :flight_id, :integer, null: false, primary_key: true
    field :boarding_no, :integer, null: false
    field :seat_no, :string, size: 4, null: false
  end
end
