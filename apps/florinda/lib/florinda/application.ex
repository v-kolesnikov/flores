defmodule Florinda.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Florinda.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Florinda.PubSub},
      # Start a worker by calling: Florinda.Worker.start_link(arg)
      # {Florinda.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Florinda.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
