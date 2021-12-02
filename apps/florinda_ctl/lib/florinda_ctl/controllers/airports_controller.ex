defmodule FlorindaCtl.AirportsController do
  use FlorindaCtl, :controller

  alias Florinda.{Repo}
  alias Florinda.Models.{Airport}

  import Ecto.Query

  def index(conn, params) do
    query = from(t in Airport, order_by: [asc: t.airport_name])
    page = Repo.paginate(
      query,
      before: params |> Map.get("ending_before"),
      after: params |> Map.get("starting_after"),
      cursor_fields: [:airport_name],
      sort_direction: :asc,
      limit: 20
    )
    render(conn, "index.html", page: page)
  end

  def show(conn, %{"id" => id}) do
    airport = Repo.get Airport, String.upcase(id)
    render(conn, "show.html", airport: airport)
  end
end
