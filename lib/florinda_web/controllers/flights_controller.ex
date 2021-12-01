defmodule FlorindaWeb.FlightsController do
  use FlorindaWeb, :controller

  alias Florinda.{Repo}
  alias Florinda.Models.{Flight}

  import Ecto.Query

  def index(conn, params) do
    query = from(t in Flight, order_by: [desc: t.flight_id])
    page = Repo.paginate(
      query,
      before: params |> Map.get("ending_before"),
      after: params |> Map.get("starting_after"),
      cursor_fields: [:flight_id],
      sort_direction: :desc,
      limit: 20
    )
    render(conn, "index.html", page: page)
  end
end
