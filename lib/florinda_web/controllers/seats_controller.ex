defmodule FlorindaWeb.SeatsController do
  use FlorindaWeb, :controller

  alias Florinda.{Repo}
  alias Florinda.Models.{Seat}

  def index(conn, _params) do
    seats =
      Seat
      |> Repo.all
    render(conn, "index.html", seats: seats)
  end
end
