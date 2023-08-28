defmodule Lely3Harvester.Authenticate.FromApiTest do
  use ExUnit.Case
  alias Lely3Harvester.Authenticate.FromApi
  doctest FromApi

  @moduletag :capture_log
  @url "http://217.148.183.172/t4c-api/T4C-API3.asmx?wsdl"
  @license "SEhLMmk0V3dWRnllQlZNK2dwVmE0Z1NpMEtHMlk1Y3ZDNzF0TGp4SitUdjZWWTlkVGxoQUNXN0pjUldTVVJJZSt3bEVaQTZwYjVKdDhEWTN4dmN5Qk01WDFkT0M1b3kvSmVaVWJXU3Bqams9"
  @user "plugin"
  @password "plugin"
  @version "3.0"

  @tag :ignore
  describe "[that the module exists]" do
    test "should: module exists" do
      assert is_list(FromApi.module_info())
    end
  end

  @tag :ignore
  describe "[that we can authenticate a user]" do
    test "should: authenticate user" do
      res =
        FromApi.authenticate(
          @url,
          @user,
          @password,
          @license,
          @version
        )

      case res do
        {:ok, rsp} ->
          IO.inspect(rsp)
          assert true

        _ ->
          assert false
      end
    end
  end

  @tag :ignore
  describe "[that we can not authenticate a user]" do
    test "should: not authenticate user for wrong password" do
      res =
        FromApi.authenticate(
          @url,
          @user,
          "blabla",
          "some-token",
          @version
        )
      IO.inspect(res)
      case res do
        {:ok, rsp} ->
          IO.inspect(rsp)
          assert true
        {:error, rsp} ->
          IO.inspect(rsp)
          assert (rsp[:reason] != nil)
      end
    end
  end

  @tag :ignore
  @tag :error
  describe "[that we can not use a wrong url]" do
    test "should: not use wrong url" do
      res =
        FromApi.authenticate(
          "http://google.com",
          @user,
          "blabla",
          "some-token",
          @version
        )

      IO.inspect(res)

      case res do
        {:ok, rsp} ->
          IO.inspect(rsp)
          assert true
        {:error, rsp} ->
          IO.inspect(rsp)
          assert (rsp[:reason] != nil)
      end
    end
  end


  #  end
end
