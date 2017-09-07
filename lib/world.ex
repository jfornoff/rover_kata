defmodule World do
  def empty(width, height) do
    %WorldState{width: width, height: height}
  end

  def put_rover(world, x, y, facing) do
    %{ world | rover: %Rover.State{x: x, y: y, facing: facing} }
  end

  def put_obstacle(world, x, y) do
    %{ world | obstacles: MapSet.put(world.obstacles, {x, y}) }
  end

  def move_rover_forward(world) do
    new_rover = Rover.Movement.move_forward(world.rover)

    if collision?(world, new_rover) do
      world
    else
      %{ world | rover: new_rover }
    end
  end

  defp collision?(%WorldState{obstacles: obstacles}, %Rover.State{} = rover) do
    MapSet.member?(obstacles, Rover.position(rover))
  end
end
