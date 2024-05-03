import Config
Livebook.config_runtime()

# Use the embedded runtime to run notebooks in the same VM
config :livebook,
  default_runtime: Livebook.Runtime.Embedded.new(),
  default_app_runtime: Livebook.Runtime.Embedded.new()
