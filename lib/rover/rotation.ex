defmodule Rover.Rotation do
  def rotate_left(current) do
    update_facing_with(current, &to_left/1)
  end

  def rotate_right(current) do
    update_facing_with(current, &to_right/1)
  end

  defp update_facing_with(current, update_fn) do
    %{current | facing: update_fn.(current.facing) }
  end

  defp to_left("N"), do: "W"
  defp to_left("S"), do: "E"
  defp to_left("E"), do: "N"
  defp to_left("W"), do: "S"

  defp to_right("N"), do: "E"
  defp to_right("S"), do: "W"
  defp to_right("E"), do: "S"
  defp to_right("W"), do: "N"
end
