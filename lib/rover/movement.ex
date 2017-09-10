defmodule Rover.Movement do
  def move_forward(%Rover.State{facing: "N"} = rover) do
    %{rover | x: rover.x + 1}
  end

  def move_forward(%Rover.State{facing: "S"} = rover) do
    %{rover | x: rover.x - 1}
  end

  def move_forward(%Rover.State{facing: "W"} = rover) do
    %{rover | y: rover.y - 1}
  end

  def move_forward(%Rover.State{facing: "E"} = rover) do
    %{rover | y: rover.y + 1}
  end
end
