defmodule Harald.MixProject do
  use Mix.Project

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  def project do
    [
      app: :harald,
      deps: deps(),
      description: description(),
      dialyzer: [
        flags: [:unmatched_returns, :error_handling, :race_conditions, :underspecs, :overspecs],
        ignore_warnings: "dialyzer_ignore.exs"
      ],
      docs: docs(),
      elixir: "~> 1.7",
      elixirc_paths: elixirc_paths(Mix.env()),
      package: package(),
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.detail": :test,
        "coveralls.post": :test,
        "coveralls.html": :test
      ],
      source_url: "https://github.com/verypossible/harald",
      start_permanent: Mix.env() == :prod,
      test_coverage: [tool: ExCoveralls],
      version: "0.1.1"
    ]
  end

  defp deps do
    [
      {:circuits_uart, "~> 1.3"},
      {:credo, "~> 1.0", runtime: false},
      {:dialyxir, "0.5.1", runtime: false},
      {:ex_doc, "~> 0.20.1", only: [:dev], runtime: false},
      {:excoveralls, "~> 0.10", only: [:test], runtime: false},
      {:mix_test_watch, "~> 0.9", only: [:dev], runtime: false},
      {:stream_data, "~> 0.1", only: [:test]}
    ]
  end

  defp description do
    """
    An Elixir Bluetooth library.
    """
  end

  defp docs do
    [
      main: "readme",
      extras: [
        "README.md",
        "docs/getting_started.md",
        "docs/testing/testing.md"
      ],
      extra_section: "DOCS",
      groups_for_extras: [
        Testing: ~r/docs\/testing\/.?/
      ]
    ]
  end

  defp elixirc_paths(:test), do: ["test/support", "lib"]

  defp elixirc_paths(_), do: ["lib"]

  defp package do
    [
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/verypossible/harald"}
    ]
  end
end
