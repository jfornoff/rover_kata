defmodule WorldState do
  defstruct rover: nil, width: 10, height: 10, obstacles: MapSet.new
end
