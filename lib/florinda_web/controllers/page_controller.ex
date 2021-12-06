defmodule FlorindaWeb.PageController do
  use FlorindaWeb, :controller

  alias YamlElixir, as: YAML

  def index(conn, _params) do
    {:ok, document} =
      "priv/data/tickets.yml"
      |> File.read!()
      |> YAML.read_from_string()
    tickets = document["tickets"]
    # TODO: enable layout back
    conn
    |> put_layout(false)
    |> put_root_layout(false)
    |> render("index.html", tickets: tickets)
  end
end
