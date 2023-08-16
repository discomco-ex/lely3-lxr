defmodule Lely3Harvester.Repo do
  use Ecto.Repo,
    otp_app: :lely3_harvester,
    adapter: Ecto.Adapters.Postgres
end
