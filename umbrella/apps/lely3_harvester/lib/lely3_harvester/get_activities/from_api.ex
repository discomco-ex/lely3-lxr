defmodule Lely3Harvester.GetActivities.FromApi do
  @moduledoc false
  require Soap

  def get_activities() do
    {:ok, []}
  end

  def get_wsdl(url) do
    Soap.Wsdl.parse_from_url(url, []) 
  end
  
  def init_model(url) do
    Soap.init_model(url, :url)    
  end
  
end
