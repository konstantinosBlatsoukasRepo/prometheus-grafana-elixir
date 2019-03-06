defmodule Metrics.FibonacciInstrumenter do
  use Prometheus.Metric
  require Logger

  def setup() do
    Histogram.declare(
      name: :santas_fibonacci_in_microseconds,
      help: "Fibonacci calculation time for a command",
      buckets: [10, 35, 80, 100, 135, 170, 200, 250, 300, 400, 1_000, 5_000, 10_000, 25_000, 100_000, 300_000],
      duration_unit: :microseconds
    )
  end

  def fibonacci_calculation(number, fibonnaci_calculator) do
    start_time = Timex.now()

    fibonacci = fibonnaci_calculator.(number)

    total_duration = total_duration(start_time)

    Histogram.observe([name: :santas_fibonacci_in_microseconds], total_duration)

    fibonacci
  end

  def total_duration(start_time) do
    Timex.now()
    |> Timex.diff(start_time, :microseconds)
    |> :erlang.convert_time_unit(:microsecond, :native)
  end

end
