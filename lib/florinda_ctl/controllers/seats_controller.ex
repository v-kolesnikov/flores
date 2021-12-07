defmodule FlorindaCtl.SeatsController do
  use FlorindaCtl, :controller

  alias FlorindaCtl.Repos.{Seats}

  def index(conn, params) do
    page = Seats.list(params)
    render(conn, "index.html", page: page)
  end
end
