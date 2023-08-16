# This file is responsible for configuring your umbrella
# and **all applications** and their dependencies with the
# help of the Config module.
#
# Note that all applications in your umbrella share the
# same configuration and dependencies, which is why they
# all use the same configuration file. If you want different
# configurations or dependencies per app, it is best to
# move said applications out of the umbrella.
import Config

# Configure Mix tasks and generators
config :lely3_harvester,
  ecto_repos: [Lely3Harvester.Repo]

# Configures the mailer
#
# By default it uses the "Local" adapter which stores the emails
# locally. You can see the emails in your browser, at "/dev/mailbox".
#
# For production it's recommended to configure a different adapter
# at the `config/runtime.exs`.
config :lely3_harvester, Lely3Harvester.Mailer, adapter: Swoosh.Adapters.Local

config :lely3_harvester_web,
  ecto_repos: [Lely3Harvester.Repo],
  generators: [context_app: :lely3_harvester]

# Configures the endpoint
config :lely3_harvester_web, Lely3HarvesterWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [
    formats: [html: Lely3HarvesterWeb.ErrorHTML, json: Lely3HarvesterWeb.ErrorJSON],
    layout: false
  ],
  pubsub_server: Lely3Harvester.PubSub,
  live_view: [signing_salt: "vsooK0pD"]

# Configure Soap
config :soap, :globals,
  version: "1.2",
  http_client: HTTPoison

# Configure esbuild (the version is required)
config :esbuild,
  version: "0.17.11",
  default: [
    args:
      ~w(js/app.js --bundle --target=es2017 --outdir=../priv/static/assets --external:/fonts/* --external:/images/*),
    cd: Path.expand("../apps/lely3_harvester_web/assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]

# Configure tailwind (the version is required)
config :tailwind,
  version: "3.3.2",
  default: [
    args: ~w(
      --config=tailwind.config.js
      --input=css/app.css
      --output=../priv/static/assets/app.css
    ),
    cd: Path.expand("../apps/lely3_harvester_web/assets", __DIR__)
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
