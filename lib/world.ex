defmodule World do
  def empty(width, height) do
    %World.State{width: width, height: height}
  end

  def put_rover(%World.State{} = world, x, y, facing) do
    %{ world | rover: %Rover.State{x: x, y: y, facing: facing} }
  end

  def put_obstacle(%World.State{} = world, x, y) do
    %{ world | obstacles: MapSet.put(world.obstacles, {x, y}) }
  end
end
