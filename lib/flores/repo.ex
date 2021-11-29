defmodule Flores.Repo do
  use Ecto.Repo,
    otp_app: :flores,
    adapter: Ecto.Adapters.Postgres
end
