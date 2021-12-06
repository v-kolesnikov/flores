defmodule FlorindaCtl.Repos.Bookings do
  alias Florinda.{Repo}
  alias Florinda.Models.{Booking}

  import Ecto.Query

  def list(params) do
    query =
      from(t in Booking)
      |> order

    Repo.paginate(
      query,
      before: params |> Map.get("ending_before"),
      after: params |> Map.get("starting_after"),
      cursor_fields: [:book_ref],
      sort_direction: :desc,
      include_total_count: true,
      total_count_primary_key_field: :book_ref,
      total_count_limit: 10_000,
      limit: 20
    )
  end

  def retrieve(id), do: retrieve(id, %{})
  def retrieve(id, opts) do
    Booking
    |> preload(^Map.get(opts, :preload, []))
    |> Repo.get(id)
  end

  def order(query) do
    from t in query, order_by: [desc: t.book_ref]
  end
end
