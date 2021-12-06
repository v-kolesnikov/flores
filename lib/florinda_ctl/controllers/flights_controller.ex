defmodule FlorindaCtl.FlightsController do
  use FlorindaCtl, :controller

  alias FlorindaCtl.Repos.{Flights}

  def index(conn, params) do
    page = Flights.list(params)
    render(conn, "index.html", page: page)
  end

  def show(conn, %{"id" => id}) do
    flight = Flights.retrieve(id)
    render(conn, "show.html", flight: flight)
  end
end
