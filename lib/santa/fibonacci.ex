defmodule Santa.Fibonacci do
  def calculate(0), do: 0

  def calculate(1), do: 1

  def calculate(number) when number > 1, do: calculate(number - 1) + calculate(number - 2)
end
