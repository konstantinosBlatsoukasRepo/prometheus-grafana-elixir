defmodule SantaApp do
  use Application


  def start(_type, _args) do
    children =
      [
        Santa.SantaSupervisor,
        {Plug.Cowboy, scheme: :http, plug: PrometheusExporter, options: [port: 8081]}
      ]

    PrometheusExporter.setup()
    Metrics.SantasInstrumenter.setup()
    Metrics.FibonacciInstrumenter.setup()

    opts = [strategy: :rest_for_one, name: SantaRegistry.Supervisor]

    Supervisor.start_link(children, opts)
  end

end
