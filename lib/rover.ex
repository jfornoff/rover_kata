defmodule Rover do
  def position(%Rover.State{x: x, y: y} = rover), do: {x, y}
end
