defmodule ProjectEuler.Mixfile do
  use Mix.Project

  def project do
    [app: :none,
     version: "0.1.0",
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: []]
  end

end
