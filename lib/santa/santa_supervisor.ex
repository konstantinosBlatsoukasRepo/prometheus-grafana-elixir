defmodule Santa.SantaSupervisor do
  use Supervisor

  @spec start_link(any()) :: :ignore | {:error, any()} | {:ok, pid()}
  def start_link(santa) do
    Supervisor.start_link(Santa.SantaSupervisor, santa)
  end

  def init(santa) do
    Supervisor.init([
      {Santa.SantaServer, [santa]}
    ], strategy: :one_for_one)
  end

end
