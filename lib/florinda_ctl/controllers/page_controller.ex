defmodule FlorindaCtl.PageController do
  use FlorindaCtl, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
