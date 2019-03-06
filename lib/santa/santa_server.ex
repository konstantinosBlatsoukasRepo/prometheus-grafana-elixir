defmodule Santa.SantaServer do
  use GenServer

  def start_link(santa) do
    GenServer.start_link(__MODULE__, santa)
  end

  @spec init(any()) :: {:ok, any()}
  def init(santa), do: {:ok, santa}

  def handle_cast({:add_gift, gift}, %Santa{gifts: gifts, name: name, from: from}) do
    {:noreply,  %Santa{gifts: [gift | gifts], name: name, from: from}}
  end

  def handle_call({:get_gifts}, _from,  santa), do: {:reply,  santa.gifts, santa}

end
