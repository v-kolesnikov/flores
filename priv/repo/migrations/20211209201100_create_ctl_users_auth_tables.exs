defmodule Florinda.Repo.Migrations.CreateCtlUsersAuthTables do
  use Ecto.Migration

  def change do
    execute "CREATE EXTENSION IF NOT EXISTS citext", ""

    create table(:ctl_users) do
      add :email, :citext, null: false
      add :hashed_password, :string, null: false
      add :confirmed_at, :naive_datetime
      timestamps()
    end

    create unique_index(:ctl_users, [:email])

    create table(:ctl_users_tokens) do
      add :user_id, references(:ctl_users, on_delete: :delete_all), null: false
      add :token, :binary, null: false
      add :context, :string, null: false
      add :sent_to, :string
      timestamps(updated_at: false)
    end

    create index(:ctl_users_tokens, [:user_id])
    create unique_index(:ctl_users_tokens, [:context, :token])
  end
end
