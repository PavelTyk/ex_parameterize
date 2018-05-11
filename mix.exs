defmodule ExParameterize.Mixfile do
  use Mix.Project

  def project do
    [
      app: :ex_parameterize,
      version: "1.0.0",
      elixir: "~> 1.5",
      deps: deps(),

      # Hex
      description: "An Elixir library to parameterize strings in any language.",
      package: package(),

      # Docs
      name: "ExParameterize",
    ]
  end

  def application do
    [
      extra_applications: []
    ]
  end

  defp deps do
    [
      {:ex_doc, "~>0.18.3", only: :dev}
    ]
  end

  defp package do
    [
      files: ["lib", "mix.exs", "README*", "LICENSE*", "CHANGELOG*"],
      maintainers: ["Pavel Tsiukhtsiayeu"],
      licenses: ["MIT"],
      links: %{
        "GitHub" => "https://github.com/paveltyk/ex_parameterize"
      },
    ]
  end
end
