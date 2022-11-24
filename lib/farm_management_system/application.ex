defmodule FarmManagementSystem.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      FarmManagementSystem.Repo,
      # Start the Telemetry supervisor
      FarmManagementSystemWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: FarmManagementSystem.PubSub},
      # Start the Endpoint (http/https)
      FarmManagementSystemWeb.Endpoint
      # Start a worker by calling: FarmManagementSystem.Worker.start_link(arg)
      # {FarmManagementSystem.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: FarmManagementSystem.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    FarmManagementSystemWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
