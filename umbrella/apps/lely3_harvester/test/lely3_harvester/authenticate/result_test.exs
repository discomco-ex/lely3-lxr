defmodule Lely3Harvester.Authenticate.ResultTest do
  use ExUnit.Case

  alias Lely3Harvester.Authenticate.Result

  @moduletag :capture_log

  doctest Result

  test "module exists" do
    assert is_list(Result.module_info())
  end

  test "should create a new Result" do
    # GIVEN
    {token, expire, reason} =
      {"some-token", DateTime.utc_now(), "no-reason-at-all"}     
    # WHEN
    result = Result.new(token,expire,reason)
    # THEN
    assert result |> is_map()
  end
end
