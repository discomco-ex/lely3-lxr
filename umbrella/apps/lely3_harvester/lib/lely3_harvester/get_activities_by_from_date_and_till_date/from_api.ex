defmodule Lely3Harvester.GetActivitiesByFromDateAndUntilDate.FromApi do
  @moduledoc false
  alias Lely3Harvester.GetActivitiesByFromDateAndUntilDate.Request
  
  @get_activities_by_from_date_and_till_date "GetActivitiesByFromAndTillDate"
  
  @spec get_activities(String.t(), 
          Lely3Harvester.Authenticate.Request.t(), 
          Request.t()) :: Lely3Harvester.GetActivitiesByFromDateAndUntilDate.Result.t()
  def get_activities(url, auth, request) do
    auth_token = url 
            |> Lely3Harvester.Authenticate.authenticate(auth)
    
    {:ok, rsp} = Soap.Request.call(
    
    ) 
    
    
    
    
   
    
  end
  
  
end
