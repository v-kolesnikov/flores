defmodule Flores.Models.Booking do
  use Ecto.Schema

  @primary_key {:book_ref, :string, []}
  schema "bookings" do
    field :book_date, :naive_datetime, null: false
    field :total_amount, :decimal, null: false
  end
end
