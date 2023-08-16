defmodule Lely3Harvester.GetActivities.FromApiTest do
  use ExUnit.Case
  alias Lely3Harvester.GetActivities.FromApi
  doctest FromApi
  @moduletag :capture_log

  @url "http://217.148.183.172/t4c-api/T4C-API3.asmx?wsdl"

  @tag :ignore
  describe "test that the module exists" do
    test "should have module_info" do
      # GIVEN
      info = FromApi.module_info()
      # WHEN
      IO.inspect(info)
      # THEN
      assert is_list(info)
    end
  end

  @tag :ignore
  describe "test that the module can retrieve the WSDL" do
    test "should: retrieve the wsdl" do
      IO.inspect("Url is #{@url}")
      wsdl = FromApi.get_wsdl(@url)

      IO.inspect(wsdl)
    end
  end

  @tag :ignore
  describe "[test that the module can Initialize a Model]" do
    test "should: initialize a model" do
      
      IO.inspect("Url is #{@url}")
      {:ok, model} = FromApi.init_model(@url)

      getActivities =
        Soap.operations(model)
        |> Enum.find(&(&1.name == "GetActivities"))

      authenticate =
        Soap.operations(model)
        |> Enum.find(&String.contains?(String.downcase(&1.name), "auth"))
        
      IO.inspect(getActivities)
      IO.inspect(authenticate)
#      Soap.call()
    end
  end
end
