defmodule Rover.Movement do
  require Rover.Direction
  alias Rover.Direction

  def move_forward(%Rover.State{facing: Direction.north} = rover) do
    %{rover | y: rover.y + 1}
  end

  def move_forward(%Rover.State{facing: Direction.south} = rover) do
    %{rover | y: rover.y - 1}
  end

  def move_forward(%Rover.State{facing: Direction.west} = rover) do
    %{rover | x: rover.x - 1}
  end

  def move_forward(%Rover.State{facing: Direction.east} = rover) do
    %{rover | x: rover.x + 1}
  end
end
