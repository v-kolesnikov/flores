defmodule FlorindaCtl.Repos.Flights do
  alias Florinda.{Repo}
  alias Florinda.Models.{Flight}

  import Ecto.Query

  def list(params) do
    query =
      from(t in Flight)
      |> by_arrival(Map.get(params, "arrival"))
      |> by_departure(Map.get(params, "departure"))
      |> by_status(Map.get(params, "status"))
      |> order

    Repo.paginate(
      query,
      before: params |> Map.get("ending_before"),
      after: params |> Map.get("starting_after"),
      cursor_fields: [:flight_id],
      sort_direction: :desc,
      include_total_count: true,
      total_count_primary_key_field: :flight_id,
      total_count_limit: 10_000,
      limit: 20
    )
  end

  def retrieve(id), do: Repo.get Flight, id

  def by_arrival(query, nil), do: query
  def by_arrival(query, arrival) do
    from t in query, where: t.arrival_airport == ^arrival
  end

  def by_departure(query, nil), do: query
  def by_departure(query, departure) do
    from t in query, where: t.departure_airport == ^departure
  end

  def by_status(query, nil), do: query
  def by_status(query, status) do
    from t in query, where: t.status == ^status
  end

  def order(query) do
    from t in query, order_by: [desc: t.flight_id]
  end
end
