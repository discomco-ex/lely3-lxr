defmodule Lely3Harvester.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, args \\ []) do
    children = [
      # Start the Ecto repository
      Lely3Harvester.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Lely3Harvester.PubSub},
      # Start Finch
      {Finch, name: Lely3Harvester.Finch},
      # Start a worker by calling: Lely3Harvester.Worker.start_link(args)
      {Lely3Harvester.Worker, name: :harvester_worker, args: args},
    ]

    Supervisor.start_link(
      children,
      strategy: :one_for_one,
      name: Lely3Harvester.Supervisor
    )
  end
end
