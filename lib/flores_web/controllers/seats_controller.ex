defmodule FloresWeb.SeatsController do
  use FloresWeb, :controller

  alias Flores.{Repo}
  alias Flores.Models.{Seat}

  def index(conn, _params) do
    seats =
      Seat
      |> Repo.all
    render(conn, "index.html", seats: seats)
  end
end
