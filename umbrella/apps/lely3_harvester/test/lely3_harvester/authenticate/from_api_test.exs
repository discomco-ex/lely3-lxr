defmodule Lely3Harvester.Authenticate.FromApiTest do
  use ExUnit.Case
  alias Lely3Harvester.Authenticate.FromApi
  doctest FromApi

  @moduletag :capture_log
  @url "http://217.148.183.172/t4c-api/T4C-API3.asmx?wsdl"

  @tag :ignore
  describe "[that the module exists]" do
    test "should: module exists" do
      assert is_list(FromApi.module_info())
    end
  end

  #  @tag :ignore
  describe "[that we can authenticate a user]" do
    test "should: authenticate user" do
      {_, res} =
        FromApi.authenticate(
          @url,
          "plugin",
          "plugin",
          "some-license",
          "1.2"
        )
        
        IO.inspect(res)

#      {:ok, model} =
#        Soap.init_model(@url, :url)
#
#      case Soap.call(
#             model,
#             "Authenticate",
#             %{
#               header: nil,
#               body: %{
#                 "userName" => "plugin",
#                 "password" => "plugin",
#                 "license" => "some-license",
#                 "version" => "3.0"
#               }
#             }
#           ) do
#        {:ok, rsp} ->
#          rsp
#          |> IO.inspect()
#
#        {:error, reason} ->
#          reason
#          IO.inspect(token)
      end
    end
#  end
end
