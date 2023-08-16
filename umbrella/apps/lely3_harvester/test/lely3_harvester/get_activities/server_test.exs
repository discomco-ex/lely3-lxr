defmodule Lely3Harvester.GetActivities.ServerTest do
  use ExUnit.Case

  alias Lely3Harvester.GetActivities.Server

  @moduletag :capture_log

  doctest Server

  @tag :ignore
  test "Should: module exists" do
    info = Server.module_info()
    assert is_list(info)
  end

  @tag :ignore
  describe "Should: check it can Retrieve Activities" do
    test "Should: get_activities/0" do
      res = {_, {_,pid}} = Lely3Harvester.Application.start(%{})
      IO.inspect(res)
      Process.sleep(1_000)
      assert Process.alive?(pid)
      info = Process.info(pid)
      IO.inspect(info)
    end
  end

  @tag :ignore
  describe "Should: start_link/1" do
    test "starts the GetActivities.Server" do
      {:ok, pid} = Server.start_link(42)
      IO.inspect(pid)
      assert Process.alive?(pid)      
    end
  end
end
