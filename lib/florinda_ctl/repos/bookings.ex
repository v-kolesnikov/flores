defmodule FlorindaCtl.Repos.Bookings do
  alias Florinda.{Repo}
  alias Florinda.Models.{Booking}

  import Ecto.Query

  def list(params) do
    from(t in Booking)
    |> order
    |> paginate(params)
  end

  def paginate(query, params) do
    Repo.paginate(
      query,
      before: params |> Map.get("ending_before"),
      after: params |> Map.get("starting_after"),
      sort_direction: :desc,
      include_total_count: true,
      total_count_primary_key_field: :book_ref,
      total_count_limit: 10_000,
      limit: 20
    )
  end

  def flights(book_ref) do
    from(
      b in Booking,
      where: b.book_ref == ^book_ref,
      join: t in Florinda.Models.Ticket,
      on: b.book_ref == t.book_ref,
      join: tf in "ticket_flights",
      on: t.ticket_no == tf.ticket_no,
      join: f in "flights_v",
      on: tf.flight_id == f.flight_id,
      left_join: bp in Florinda.Models.BoardingPass,
      on: tf.ticket_no == bp.ticket_no and tf.flight_id == bp.flight_id,
      order_by: [asc: t.ticket_no, asc: f.scheduled_departure],
      select: %{
        book_ref: b.book_ref,
        ticket_no: t.ticket_no,
        flight_no: f.flight_no,
        passenger_name: t.passenger_name,
        fare_conditions: tf.fare_conditions,
        amount: tf.amount,
        scheduled_departure_local: f.scheduled_departure_local,
        scheduled_arrival_local: f.scheduled_arrival_local,
        departure: f.departure_city,
        arrival: f.arrival_city,
        status: f.status,
        seat_no: bp.seat_no
      }
    )
    |> Repo.all
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
