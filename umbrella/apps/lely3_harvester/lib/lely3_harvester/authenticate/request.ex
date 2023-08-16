defmodule Lely3Harvester.Authenticate.Request do
   @enforce_keys [:user, :password, :license, :version]
   defstruct [:user, :password, :license, :version] 
  
  
  @moduledoc false

  def new(user, password, license, version) do
    %Lely3Harvester.Authenticate.Request{
      user: user,
      password: password,
      license: license,
      version: version
    }
  end
end
