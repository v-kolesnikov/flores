defmodule Florinda.Repo do
  use Ecto.Repo,
    otp_app: :florinda,
    adapter: Ecto.Adapters.Postgres
  use Quarto, cursor: Florinda.Repo.Cursor
end
