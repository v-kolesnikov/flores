defmodule FlorindaCtl.AircraftsController do
  use FlorindaCtl, :controller

  alias Florinda.{Repo}
  alias Florinda.Models.{Aircraft}

  import Ecto.Query

  def index(conn, params) do
    query = from(t in Aircraft, order_by: [asc: t.aircraft_code])
    page = Repo.paginate(
      query,
      before: params |> Map.get("ending_before"),
      after: params |> Map.get("starting_after"),
      cursor_fields: [:aircraft_code],
      sort_direction: :asc,
      limit: 20
    )
    render(conn, "index.html", page: page)
  end
end
