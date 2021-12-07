defmodule FlorindaCtl.TicketsController do
  use FlorindaCtl, :controller

  alias FlorindaCtl.Repos.Tickets

  def index(conn, params) do
    page = Tickets.list(params)
    render(conn, "index.html", page: page)
  end
end
