defmodule FloresWeb.AircraftsController do
  use FloresWeb, :controller

  alias Flores.{Repo}
  alias Flores.Models.{Aircraft}

  def index(conn, _params) do
    aircrafts =
      Aircraft
      |> Repo.all
    render(conn, "index.html", aircrafts: aircrafts)
  end
end
