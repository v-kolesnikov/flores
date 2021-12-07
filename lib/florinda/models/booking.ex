defmodule Florinda.Models.Booking do
  use Ecto.Schema

  alias Florinda.Models

  @primary_key {:book_ref, :string, []}
  schema "bookings" do
    field :book_date, :naive_datetime, null: false
    field :total_amount, :decimal, null: false

    has_many :tickets, Models.Ticket,
      references: :book_ref,
      foreign_key: :book_ref
  end
end
