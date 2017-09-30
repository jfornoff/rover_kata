defmodule Rover.RotationTest do
  use ExUnit.Case

  require Rover.Direction
  alias Rover.Direction
  alias Rover.Rotation

  describe "rotating left" do
    test "when facing north, rotates to west" do
      %Rover.State{x: 0, y: 0, facing: Direction.north}
      |> Rotation.rotate_left
      |> assert_equal(%Rover.State{x: 0, y: 0, facing: Direction.west})
    end

    test "when facing west, rotates to south" do
      %Rover.State{x: 0, y: 0, facing: Direction.west}
      |> Rotation.rotate_left
      |> assert_equal(%Rover.State{x: 0, y: 0, facing: Direction.south})
    end
  end

  describe "rotating right" do
    test "when facing west, rotates to north" do
      %Rover.State{x: 0, y: 0, facing: Direction.west}
      |> Rotation.rotate_right
      |> assert_equal(%Rover.State{x: 0, y: 0, facing: Direction.north})
    end

    test "when facing south, rotates to west" do
      %Rover.State{x: 0, y: 0, facing: Direction.south}
      |> Rotation.rotate_right
      |> assert_equal(%Rover.State{x: 0, y: 0, facing: Direction.west})
    end
  end

  defp assert_equal(got, expect) do
    assert got == expect
  end
end
