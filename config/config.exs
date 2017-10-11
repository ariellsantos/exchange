# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :exchange,
  ecto_repos: [Exchange.Repo]

# Configures the endpoint
config :exchange, ExchangeWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "GXd5WotykuK/SQsGITLOvNx9U0O4ilFKLOkFglFN30C5CCqXNVh2PpBQYvvIqhjG",
  render_errors: [view: ExchangeWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Exchange.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
