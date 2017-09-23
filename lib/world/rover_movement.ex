defmodule World.RoverMovement do
  def execute_sequence(%World.State{rover: nil}, _sequence_definition) do
    {:err, :no_rover}
  end

  def execute_sequence(%World.State{} = world, sequence_definition) do
    sequence_definition
    |> String.codepoints()
    |> Enum.reduce_while({:ok, world}, fn step_letter, {:ok, current_world} ->
      case execute_step(current_world, step_letter) do
        {:ok, new_world} -> {:cont, {:ok, new_world}}
        {:err, reason} -> {:halt, {:stopped, reason}}
      end
    end)
  end

  def execute_step(%World.State{} = world, "F") do
    move_rover_forward world
  end

  def execute_step(%World.State{} = world, "L") do
    {:ok, update_rover_with(world, &Rover.Rotation.rotate_left/1)}
  end

  def execute_step(%World.State{} = world, "R") do
    {:ok, update_rover_with(world, &Rover.Rotation.rotate_right/1)}
  end

  def move_rover_forward(%World.State{} = world) do
    new_rover =
      world.rover
      |> Rover.Movement.move_forward()
      |> wrap_if_needed(world)

    if collision?(world, new_rover) do
      {:err, :collision}
    else
      {:ok, %{world | rover: new_rover}}
    end
  end

  def wrap_if_needed(rover, %World.State{width: width, height: height}) do
    %{rover | x: rem(rover.x + width, width), y: rem(rover.y + height, height)}
  end

  defp update_rover_with(%World.State{} = world, update_fn) do
    %{world | rover: update_fn.(world.rover)}
  end


  defp collision?(%World.State{obstacles: obstacles}, %Rover.State{} = rover) do
    MapSet.member? obstacles, Rover.position(rover)
  end
end
