defmodule Rover.RotationTest do
  use ExUnit.Case

  alias Rover.Rotation

  describe "rotating left" do
    test "when facing north, rotates to west" do
      %Rover.State{x: 0, y: 0, facing: "N"}
      |> Rotation.rotate_left
      |> assert_equal(%Rover.State{x: 0, y: 0, facing: "W"})
    end

    test "when facing west, rotates to south" do
      %Rover.State{x: 0, y: 0, facing: "W"}
      |> Rotation.rotate_left
      |> assert_equal(%Rover.State{x: 0, y: 0, facing: "S"})
    end
  end

  describe "rotating right" do
    test "when facing west, rotates to north" do
      %Rover.State{x: 0, y: 0, facing: "W"}
      |> Rotation.rotate_right
      |> assert_equal(%Rover.State{x: 0, y: 0, facing: "N"})
    end

    test "when facing south, rotates to west" do
      %Rover.State{x: 0, y: 0, facing: "S"}
      |> Rotation.rotate_right
      |> assert_equal(%Rover.State{x: 0, y: 0, facing: "W"})
    end
  end

  defp assert_equal(got, expect) do
    assert got == expect
  end
end
