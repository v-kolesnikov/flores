defmodule FlorindaWeb.AircraftsController do
  use FlorindaWeb, :controller

  alias Florinda.{Repo}
  alias Florinda.Models.{Aircraft}

  def index(conn, _params) do
    aircrafts =
      Aircraft
      |> Repo.all
    render(conn, "index.html", aircrafts: aircrafts)
  end
end
