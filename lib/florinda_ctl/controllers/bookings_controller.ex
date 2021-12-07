defmodule FlorindaCtl.BookingsController do
  use FlorindaCtl, :controller

  alias FlorindaCtl.Repos.{Bookings}

  def index(conn, params) do
    page = Bookings.list(params)
    render(conn, "index.html", page: page)
  end

  def show(conn, %{"id" => id}) do
    booking = Bookings.retrieve(id, %{preload: :tickets})
    render(conn, "show.html", booking: booking)
  end
end
