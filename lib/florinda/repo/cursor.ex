defmodule Florinda.Repo.Cursor do
  @behaviour Quarto.Cursor

  @impl true
  def decode(cursor, opts \\ [])
  def decode(nil, _opts), do: {:ok, nil}
  def decode(cursor, _opts), do: {:ok, String.split(cursor, ",") }

  @impl true
  def decode!(encoded_cursor, opts \\ []) do
    case decode(encoded_cursor, opts) do
      {:ok, cursor} -> cursor
      _ -> raise(ArgumentError, "error decoding cursor (#{encoded_cursor})")
    end
  end

  @impl true
  def encode(values, opts \\ [])
  def encode(values, _opts) when is_list(values) do
    {:ok, Enum.join(values, ",") }
  end
  def encode(value, _opts), do: encode([value])

  @impl true
  def encode!(values, opts \\ []) do
    {:ok, cursor} = encode(values, opts)
    cursor
  end
end
