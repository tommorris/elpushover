defmodule Elpushover.MixProject do
  use Mix.Project

  def project do
    [
      app: :elpushover,
      version: "0.1.0",
      elixir: "~> 1.8",
      start_permanent: Mix.env() == :prod,

      name: "elpushover",
      deps: deps(),
      docs: [
        main: "elpushover"
      ]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:httpoison, "~> 1.6"},
      {:jason, "~> 1.1"},
      {:ex_doc, "~> 0.19", only: [:dev, :test, :docs], runtime: false},
      {:mock, "~> 0.1.1", only: :test},
      {:inch_ex, github: "rrrene/inch_ex", only: [:dev, :test]},
    ]
  end
end
