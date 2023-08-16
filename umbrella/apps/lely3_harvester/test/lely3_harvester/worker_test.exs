defmodule Lely3Harvester.Worker.Test do
  use ExUnit.Case
  doctest Lely3Harvester.Worker

  @doc """
  """
  @tag :ignore
  describe "" do
    test "ShouldInitialize42" do
      case Lely3Harvester.Worker.start_link(42) do
        {:ok, pid} ->
          IO.inspect(pid)

        _ ->
          {:something_else}
      end
    end
  end
end
