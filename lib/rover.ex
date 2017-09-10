defmodule Rover do
  def position(%Rover.State{x: x, y: y}), do: {x, y}
end
