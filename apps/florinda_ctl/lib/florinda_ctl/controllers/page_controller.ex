defmodule FlorindaCtl.PageController do
  use FlorindaCtl, :controller

  def index(conn, _params) do
    conn
    |> put_layout(false)
    |> put_root_layout(false)
    |> render("index.html")
  end
end
