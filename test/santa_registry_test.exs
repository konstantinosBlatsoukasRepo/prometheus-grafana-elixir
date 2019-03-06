defmodule SantaRegistryTest do
  use ExUnit.Case
  doctest SantaRegistry

  test "greets the world" do
    assert SantaRegistry.hello() == :world
  end
end
