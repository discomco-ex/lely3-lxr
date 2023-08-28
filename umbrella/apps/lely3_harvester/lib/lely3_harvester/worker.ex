defmodule Lely3Harvester.Worker do
  use GenServer

  # CLIENT
  def get_pi(pid) do
    GenServer.call(pid, :get_pi, :infinity)
  end

  def start_link(args) do
    __MODULE__
    |> GenServer.start_link(args)
  end

  ## SERVER  
  def init(init_arg) do
    {:ok, init_arg}
  end

  def handle_call(:get_pi, _from, state) do
    {:reply, {:pi, 3.14159}, state}
  end

  @impl GenServer
  def handle_info(msg, state) do
    msg
    |> IO.inspect(msg)

    {:info, msg}
  end

  @impl GenServer
  def handle_info(:get_pi, state \\ []) do
    {:pi, 3.14}
  end
end
