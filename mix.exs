defmodule KoderkiLivebook.MixProject do
  use Mix.Project

  def project do
    [
      app: :koderki_livebook,
      version: "0.1.0",
      elixir: "~> 1.16",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :runtime_tools, :inets],
      mod: {KoderkiLivebook.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:livebook, "~> 0.12.1"},
      {:kino, "~> 0.12.3"}
    ]
  end
end
