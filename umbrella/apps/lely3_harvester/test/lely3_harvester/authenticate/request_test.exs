defmodule Lely3Harvester.Authenticate.RequestTest do
  use ExUnit.Case

  @moduledoc false
  alias Lely3Harvester.Authenticate.Request

  @tag :ignore
  describe "[Test that we can create a request]" do
    test "should: call new/4" do
      req =
        Request.new(
          "plugin",
          "plugin",
          "license",
          "version"
        )
        req
        |> IO.inspect()
    end
  end
end
