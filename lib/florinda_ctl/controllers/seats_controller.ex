defmodule FlorindaCtl.SeatsController do
  use FlorindaCtl, :controller

  alias Florinda.{Repo}
  alias Florinda.Models.{Seat}

  import Ecto.Query

  def index(conn, params) do
    aircraft_code = params |> Map.get("aircraft")
    query = from t in Seat,
      where: t.aircraft_code == ^aircraft_code,
      order_by: [desc: t.aircraft_code, desc: t.seat_no]
    page = Repo.paginate(
      query,
      before: params |> Map.get("ending_before"),
      after: params |> Map.get("starting_after"),
      cursor_fields: [:aircraft_code, :seat_no],
      sort_direction: :desc,
      limit: 20
    )
    render(conn, "index.html", page: page)
  end
end
