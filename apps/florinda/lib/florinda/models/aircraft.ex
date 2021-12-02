defmodule Florinda.Models.Aircraft do
  use Ecto.Schema

  @primary_key {:aircraft_code, :string, []}
  schema "aircrafts" do
    field :model, :string
    field :range, :integer
  end
end
