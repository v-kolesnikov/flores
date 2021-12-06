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
      # Start the Telemetry supervisor
      FlorindaCtl.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Florinda.PubSub},
      # Start the Endpoint (http/https)
      case System.get_env("APP") do
        "CTL" -> FlorindaCtl.Endpoint
        "WEB" -> FlorindaWeb.Endpoint
        _ -> FlorindaCtl.Endpoint
      end
      # Start a worker by calling: Florinda.Worker.start_link(arg)
      # {Florinda.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Florinda.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    FlorindaCtl.Endpoint.config_change(changed, removed)
    :ok
  end
end
