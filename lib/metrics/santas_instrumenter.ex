defmodule Metrics.SantasInstrumenter do
  use Prometheus.Metric
  require Logger

  def setup() do
    Counter.declare(
      name: :santas_total,
      help: "Total number of Santas"
    )
  end

  def increase() do
    Counter.inc(name: :santas_total)
  end

end
