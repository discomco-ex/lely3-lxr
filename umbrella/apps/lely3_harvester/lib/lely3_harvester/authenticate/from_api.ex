defmodule Lely3Harvester.Authenticate.FromApi do
  require Soap
  @moduledoc false

  def authenticate(url, username, password, license, version) do
    {:ok, model} =
      Soap.init_model(url, :url)

    case model
         |> Soap.call(
           "Authenticate",
           %{
             header: nil,
             body: %{
               userName: username,
               password: password,
               license: license,
               version: version
             }
           }
         ) do
      {:ok, rsp} ->
        rsp

      {:error, reason} ->
        IO.inspect(reason)

      _ ->
        {:error}
    end
  end
end
