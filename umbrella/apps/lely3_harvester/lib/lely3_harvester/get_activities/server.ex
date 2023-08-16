defmodule Lely3Harvester.GetActivities.Server do
  use GenServer

  @moduledoc false

  @url "http://217.148.183.172/t4c-api/T4C-API3.asmx?wsdl" 
  
  
  def start_link(state, opts \\ []) do
    GenServer.start_link(__MODULE__, state, opts)
  end

  @impl GenServer
  def init(_opts) do
    {:ok, %{}}
  end

  @impl GenServer
  def handle_call({:get_activities, url}, _from, state) do
    res = Soap.Wsdl.parse_from_url(url)
    IO.inspect(res)
    {:reply, res, state}
  end

  @impl GenServer
  def handle_cast(_msg, state), do: {:noreply, state}

  ## Client Functions

  def get_activities(url \\ @url) do
    GenServer.call(__MODULE__, {:get_activites, url})
  end
end
