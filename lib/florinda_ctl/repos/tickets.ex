defmodule FlorindaCtl.Repos.Tickets do
  alias Florinda.{Repo}
  alias Florinda.Models.{Ticket}

  import Ecto.Query

  def list(params) do
    query =
      from(t in Ticket)
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

  def retrieve(id), do: Repo.get Ticket, id

  def order(query) do
    from t in query, order_by: [desc: t.ticket_no]
  end
end

