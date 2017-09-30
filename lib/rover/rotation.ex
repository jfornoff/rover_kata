defmodule Rover.Rotation do
  @moduledoc """
  Provides functions for rotating Rover
  """

  require Rover.Direction
  alias Rover.Direction

  @doc "Rotates Rover left"
  def rotate_left(current) do
    update_facing_with(current, &to_left/1)
  end

  @doc "Rotates Rover right"
  def rotate_right(current) do
    update_facing_with(current, &to_right/1)
  end

  defp update_facing_with(current, update_fn) do
    %{current | facing: update_fn.(current.facing)}
  end

  defp to_left(Direction.north), do: Direction.west
  defp to_left(Direction.south), do: Direction.east
  defp to_left(Direction.east), do: Direction.north
  defp to_left(Direction.west), do: Direction.south

  defp to_right(Direction.north), do: Direction.east
  defp to_right(Direction.south), do: Direction.west
  defp to_right(Direction.east), do: Direction.south
  defp to_right(Direction.west), do: Direction.north
end
