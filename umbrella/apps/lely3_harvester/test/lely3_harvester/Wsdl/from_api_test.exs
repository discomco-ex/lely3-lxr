defmodule Lely3Harvester.Wsdl.FromApiTest do
  use ExUnit.Case
  
  require Lely3Harvester.Wsdl.FromApi

  alias Lely3Harvester.Wsdl.FromApi

  @moduletag :capture_log
  
  @url "http://217.148.183.172/t4c-api/T4C-API3.asmx?wsdl"

  doctest FromApi

  test "module exists" do
    assert is_list(FromApi.module_info())
  end
  
  test "that we can get the model" do
    
    res = Lely3Harvester.Wsdl.FromApi.init_model(@url)
    
    IO.inspect res
    
  end
  
  
  
  
end
