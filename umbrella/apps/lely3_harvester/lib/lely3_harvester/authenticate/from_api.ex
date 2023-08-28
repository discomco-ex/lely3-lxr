defmodule Lely3Harvester.Authenticate.FromApi do
  require Soap
  @moduledoc false

  @authenticate "Authenticate"

  @license "SEhLMmk0V3dWRnllQlZNK2dwVmE0Z1NpMEtHMlk1Y3ZDNzF0TGp4SitUdjZWWTlkVGxoQUNXN0pjUldTVVJJZSt3bEVaQTZwYjVKdDhEWTN4dmN5Qk01WDFkT0M1b3kvSmVaVWJXU3Bqams9"

  @spec auth(
          Lely3Harvester.Model.t(),
          Lely3Harvester.Authenticate.Request.t()
        ) :: Any.t()
  defp auth(model, request) do
    {:ok, rsp} =
      Soap.Request.call(
        model,
        @authenticate,
        %{
          request: %{
            UserName: request.user,
            Password: request.password,
            License: request.license,
            Version: request.version
          }
        }
      )

    parsed =
      rsp.body
      |> Soap.Response.Parser.parse(:success)

    case rsp.status_code do
      200 ->
        {:ok,
         %{
           token: parsed[:AuthenticateResponse][:AuthenticateResult][:Token],
           expire: parsed[:AuthenticateResponse][:AuthenticateResult][:Expire]
         }}

      _ ->
        %{"soap:Fault": %{"soap:Reason": %{"soap:Text": reason}}} = parsed
        {:error,
         %{
           reason: reason
         }}
    end
  end

  def authenticate(url, username, password, license, version) do
    req = %Lely3Harvester.Authenticate.Request{
      user: username,
      password: password,
      license: license,
      version: version
    }
    case Soap.init_model(url, :url) do
      {:fatal, res} ->
        {:error, res}

      {:ok, model} ->
        auth(model, req)
    end
  end
end
