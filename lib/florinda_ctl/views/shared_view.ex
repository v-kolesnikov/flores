defmodule FlorindaCtl.SharedView do
  use FlorindaCtl, :view

  def next_page_url(conn, page) do
    query =
      conn.query_params
      |> Map.merge(%{"starting_after" => page.metadata.after})
      |> Map.delete("ending_before")
      |> URI.encode_query
    "#{conn.request_path}?#{query}"
  end

  def prev_page_url(conn, page) do
    query =
      conn.query_params
      |> Map.merge(%{"ending_before" => page.metadata.before})
      |> Map.delete("starting_after")
      |> URI.encode_query
    "#{conn.request_path}?#{query}"
  end

  def total_results(count) do
    {:ok, s} = Cldr.Number.to_string(count)
    s
  end
end
