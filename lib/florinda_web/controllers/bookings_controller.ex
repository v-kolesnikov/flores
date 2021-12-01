defmodule FlorindaWeb.BookingsController do
  use FlorindaWeb, :controller

  alias Florinda.{Repo}
  alias Florinda.Models.{Booking}

  import Ecto.Query

  def index(conn, params) do
    query = from(b in Booking, order_by: [desc: b.book_ref])
    page = Repo.paginate(
      query,
      before: params |> Map.get("ending_before"),
      after: params |> Map.get("starting_after"),
      cursor_fields: [:book_ref],
      sort_direction: :desc,
      limit: 20
    )
    render(conn, "index.html", page: page)
  end
end
