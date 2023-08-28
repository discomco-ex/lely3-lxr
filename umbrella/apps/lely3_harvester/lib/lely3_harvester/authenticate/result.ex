defmodule Lely3Harvester.Authenticate.Result do
  @require_keys [:reason]
  defstruct [:token, :expire, :reason]
  @moduledoc false

  alias Lely3Harvester.Authenticate.Result

  @spec new(
          String.t(),
          DateTime.t(),
          String.t()
        ) :: %Lely3Harvester.Authenticate.Result{}
  def new(token, expire, reason) do
    %Result{
      token: token,
      expire: expire,
      reason: reason
    }
  end
end
