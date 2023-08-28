defmodule Lely3Harvester.GetActivitiesByFromDateAndUntilDate.FromApiTest do
  use ExUnit.Case
  alias Lely3Harvester.GetActivitiesByFromDateAndUntilDate.FromApi
  @moduletag :capture_log

  doctest Lely3Harvester.GetActivitiesByFromDateAndUntilDate.FromApi

  test "module exists" do
    assert is_list(FromApi.module_info())
  end
  
  test "should: get_activities_by_from_date_and_till_date" do   
    
  end
  
end
