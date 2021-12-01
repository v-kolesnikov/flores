defmodule FlorindaWeb.SeatsController do
  use FlorindaWeb, :controller

  alias Florinda.{Repo}
  alias Florinda.Models.{Seat}

  import Ecto.Query

  def index(conn, _params) do
    seats =
      Seat
      |> limit(20)
      |> Repo.all
    render(conn, "index.html", seats: seats)
  end
end
