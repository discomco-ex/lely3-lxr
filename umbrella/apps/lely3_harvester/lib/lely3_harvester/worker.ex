defmodule Lely3Harvester.Worker do
  use GenServer

  @impl GenServer
  def init(init_arg) do
    {:ok, init_arg}
  end

  def start_link(args) do
    __MODULE__
    |> GenServer.start_link(args)
  end

  @impl GenServer
  def handle_cast(msg, _accuracy) do
    case msg do
      {:get_pi} ->
       {res, pi} = {:pi, 3.14159}
       IO.inspect("Here is PI: #{pi}}")
       {res, pi}
      _ ->
        {:haha}
    end
  end

  # Interface Functions

  
end
