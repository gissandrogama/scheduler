# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :scheduler,
  ecto_repos: [Scheduler.Repo]

# Configures the endpoint
config :scheduler, SchedulerWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "e03bwFOAo4+/QJ+wx9aeIRkpwvIjQUy7JuG3hOo5WPccGfhF/H2PhuKjSAbZFjUJ",
  render_errors: [view: SchedulerWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Scheduler.PubSub,
  live_view: [signing_salt: "TOmWs9AG"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
