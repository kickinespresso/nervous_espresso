# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Import target specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
# Uncomment to use target specific configurations

config :ui, Ui.Endpoint,
  http: [port: 80],
  url: [host: "localhost", port: 80],
  secret_key_base: "cIqrpEFth3j9ZGg1RQvsvzVOE6hl7IHZbnkqbHmMOfTJO/+mO4loJV/EWDbCXnpH",
  root: Path.dirname(__DIR__),
  server: true,
  render_errors: [accepts: ~w(html json)],
  pubsub: [name: Ui.PubSub,
         adapter: Phoenix.PubSub.PG2]

config :logger, level: :debug
# import_config "#{Mix.Project.config[:target]}.exs"
