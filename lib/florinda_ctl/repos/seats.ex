defmodule FlorindaCtl.Repos.Seats do
  alias Florinda.{Repo}
  alias Florinda.Models.{Seat}

  import Ecto.Query

  def list(params) do
    from(t in Seat)
    |> by_aircraft(Map.get(params, "aircraft"))
    |> order
    |> paginate(params)
  end

  defp paginate(query, params) do
    Repo.paginate(
      query,
      before: params |> Map.get("ending_before"),
      after: params |> Map.get("starting_after"),
      sort_direction: :desc,
      include_total_count: true,
      total_count_primary_key_field: [:aircraft_code, :seat_no],
      total_count_limit: 10_000,
      limit: 20
    )
  end

  defp by_aircraft(query, nil), do: query
  defp by_aircraft(query, aircraft) do
    from t in query, where: t.aircraft_code == ^aircraft
  end

  defp order(query) do
    from t in query, order_by: [desc: t.aircraft_code], order_by: [desc: t.seat_no]
  end
end
