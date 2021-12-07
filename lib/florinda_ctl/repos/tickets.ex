defmodule FlorindaCtl.Repos.Tickets do
  alias Florinda.{Repo}
  alias Florinda.Models.{Ticket}

  import Ecto.Query

  def list(params) do
    query =
      from(t in Ticket)
      |> by_flight(Map.get(params, "flight"))
      |> order

    Repo.paginate(
      query,
      before: params |> Map.get("ending_before"),
      after: params |> Map.get("starting_after"),
      sort_direction: :desc,
      include_total_count: true,
      total_count_primary_key_field: :ticket_no,
      total_count_limit: 10_000,
      limit: 20
    )
  end

  def retrieve(id), do: retrieve(id, %{})
  def retrieve(id, opts) do
    Ticket
    |> preload(^Map.get(opts, :preload, []))
    |> Repo.get(id)
  end

  defp by_flight(query, nil), do: query
  defp by_flight(query, flight) do
    from t in query,
      join: flights in assoc(t, :flights),
      on: flights.flight_id == ^flight
  end

  defp order(query) do
    from t in query, order_by: [desc: t.ticket_no]
  end
end

