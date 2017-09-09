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

  def execute_sequence(world, sequence_definition) do
    sequence_definition
    |> String.codepoints
    |> Enum.reduce_while({:ok, world}, fn step_letter, {:ok, current_world} ->
      case World.execute_step(current_world, step_letter) do
        {:ok, new_world} -> {:cont, {:ok, new_world}}
        {:err, reason} -> {:halt, {:stopped, reason}}
      end
    end)
  end

  def execute_step(world, "F") do
    move_rover_forward(world)
  end

  def execute_step(world, "L") do
    {:ok, update_rover_with(world, &Rover.Rotation.rotate_left/1)}
  end

  def execute_step(world, "R") do
    {:ok, update_rover_with(world, &Rover.Rotation.rotate_right/1)}
  end

  def move_rover_forward(world) do
    new_rover = Rover.Movement.move_forward(world.rover)

    if collision?(world, new_rover) do
      {:err, :collision}
    else
      {
        :ok,
        %{ world | rover: new_rover }
      }
    end
  end

  defp update_rover_with(world, update_fn) do
    %{ world | rover: update_fn.(world.rover) }
  end

  defp collision?(%WorldState{obstacles: obstacles}, %Rover.State{} = rover) do
    MapSet.member?(obstacles, Rover.position(rover))
  end
end
