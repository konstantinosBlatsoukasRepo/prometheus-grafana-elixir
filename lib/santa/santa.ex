defmodule Santa do
  defstruct  name: "", from: "", gifts: []

  def new(name, from), do: %Santa{name: name, from: from}

  def add_gift(%Santa{gifts: gifts, name: name, from: from}, gift), do:
    %Santa{gifts: [gift | gifts], name: name, from: from}

  def show_gifts(%Santa{gifts: gifts}), do: gifts

end
