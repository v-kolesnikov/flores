defmodule FloresWeb.PageController do
  use FloresWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
