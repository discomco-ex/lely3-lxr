import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :lely3_harvester, Lely3Harvester.Repo,
  username: "postgres",
  password: "dev",
  hostname: "localhost",
  database: "lely3_harvester_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :lely3_harvester_web, Lely3HarvesterWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "/D4jd491Rjc3UroYG7lJ8h1viVqyoBSO+4vlTgbU4XrWIHubkyiDUgfQxQ3IXz20",
  server: false

# Print only warnings and errors during test
config :logger, level: :warning

# In test we don't send emails.
config :lely3_harvester, Lely3Harvester.Mailer, adapter: Swoosh.Adapters.Test

# Disable swoosh api client as it is only required for production adapters.
config :swoosh, :api_client, false

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
