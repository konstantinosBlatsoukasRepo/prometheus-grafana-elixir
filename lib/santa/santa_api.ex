defmodule Santa.SantaApi do
  def start_link(santa), do: GenServer.start_link(Santa.SantaServer, santa)

  def add_gift(santa_pid, gift), do: GenServer.cast(santa_pid, {:add_gift, gift})

  def show_gifts(santa_pid), do: GenServer.call(santa_pid, {:get_gifts})

end
