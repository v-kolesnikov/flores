defmodule FlorindaCtl.TicketsController do
  use FlorindaCtl, :controller

  alias FlorindaCtl.Repos.Tickets

  def index(conn, params) do
    page = Tickets.list(params)
    render(conn, "index.html", page: page)
  end

  def show(conn, %{"id" => id}) do
    ticket = Tickets.retrieve(id, %{preload: [:flights]})
    render(conn, "show.html", ticket: ticket)
  end
end
