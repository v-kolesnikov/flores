defmodule Flores.Models.Airport do
  use Ecto.Schema

  @primary_key {:airport_code, :string, []}
  schema "airports" do
    field :airport_name, :string, null: false
    field :city, :string, null: false
    field :longitude, :decimal, null: false
    field :latitude, :decimal, null: false
    field :timezone, :string, null: false
  end
end
