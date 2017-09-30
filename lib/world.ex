defmodule World do
  @moduledoc """
  Functions for constructing the world data structure, setting the position
  of rover and adding obstacles
  """

  require Rover.Direction
  alias Rover.Direction

  @spec empty(width :: integer, height :: integer) :: %World.State{}
  def empty(width, height) do
    %World.State{width: width, height: height}
  end

  @spec put_rover(
    %World.State{},
    x :: integer,
    y :: integer,
    facing :: Rover::State.direction
  ) :: %World.State{}
  def put_rover(%World.State{} = world, x, y, facing) when facing in Direction.directions do
    %{world | rover: %Rover.State{x: x, y: y, facing: facing}}
  end

  @spec put_obstacle(
    %World.State{},
    x :: integer,
    y :: integer
  ) :: %World.State{}
  def put_obstacle(%World.State{} = world, x, y) do
    %{world | obstacles: MapSet.put(world.obstacles, {x, y})}
  end
end
