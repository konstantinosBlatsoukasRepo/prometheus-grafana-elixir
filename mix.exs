defmodule SantaRegistry.MixProject do
  use Mix.Project

  def project do
    [
      app: :santa_registry,
      version: "0.1.0",
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :prometheus_ex],
      mod: {SantaApp, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:prometheus_ex, "~> 3.0"},
      {:prometheus_plugs, "~> 1.1"},
      {:plug_cowboy, "~> 2.0", override: true},
      {:timex, "~> 3.1"}
    ]
  end
end
