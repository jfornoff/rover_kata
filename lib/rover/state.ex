defmodule Rover.State do
  @moduledoc """
  Struct representing the position and direction that Rover is facing at some
  point in time.
  """

  require Rover.Direction

  defstruct x: 0, y: 0, facing: Rover.Direction.north()
end
