import Config

config :logger, level: :warning

# Livebook's learn section is built at compile-time
config :livebook, :learn_notebooks, [
  %{
    # Required notebook path
    path: "#{File.cwd!()}/koderki-curriculum/wprowadzenie-czesc.livemd",
    # Optional notebook identifier for URLs, as in /learn/notebooks/{slug}
    # By default the slug is inferred from file name, so there is no need to set it
    slug: "koderki-start",
    # Optional list of images
    # image_paths: [
    #  # This image can be sourced as images/myimage.jpg in the notebook
    #  "/path/to/myimage.jpg"
    # ],
    # Optional details for the notebook card. If omitted, the notebook
    # is hidden in the UI, but still accessible under /learn/notebooks/{slug}
    details: %{
      cover_path: "#{File.cwd!()}/koderki-curriculum/files/koderki-logo.png",
      description: "koderki.pl - zmieniaj świat kodując"
    }
  }
  # %{path: "#{File.cwd!()}/priv/samples/basics/sys_class_leds.livemd", details: nil},
]

# Enable the embedded runtime which isn't available by default
config :livebook, :runtime_modules, [Livebook.Runtime.Embedded, Livebook.Runtime.Attached]

# Set the password to "nerves".
config :livebook,
  authentication_mode: :password,
  password: "koderki"

# Set the Erlang distribution cookie
config :livebook,
  cookie: :koderki_livebook_cookie

# Set the Erlang distribution cookie
config :livebook, :apps_path, "#{File.cwd!()}/koderki-curriculum/apps/"

config :livebook, LivebookWeb.Endpoint,
  adapter: Bandit.PhoenixAdapter,
  url: [host: "localhost", path: "/"],
  pubsub_server: Livebook.PubSub,
  live_view: [signing_salt: "livebook"],
  drainer: [shutdown: 1000],
  render_errors: [formats: [html: LivebookWeb.ErrorHTML], layout: false],
  http: [
    port: 8080,
    http_1_options: [max_header_length: 32768],
    http_2_options: [max_header_value_length: 32768]
  ],
  code_reloader: false,
  server: true

config :livebook, :iframe_port, 8081

# Defaults for required configurations
config :livebook,
  teams_url: "https://teams.livebook.dev",
  app_service_name: nil,
  app_service_url: nil,
  feature_flags: [],
  force_ssl_host: nil,
  plugs: [],
  shutdown_callback: nil,
  update_instructions_url: nil,
  within_iframe: false,
  allowed_uri_schemes: [],
  aws_credentials: false
