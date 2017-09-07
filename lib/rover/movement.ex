defmodule Rover.Movement do
  def move_forward(%Rover.State{facing: "N"} = rover) do
    %{ rover | x: rover.x + 1 }
  end
end
