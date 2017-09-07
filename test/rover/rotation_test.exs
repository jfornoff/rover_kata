defmodule Rover.RotationTest do
  use ExUnit.Case

  alias Rover.Rotation

  describe "rotating left" do
    test "when facing north, rotates to west" do
      {0, 0, "N"}
      |> Rotation.rotate_left
      |> assert_equal({0, 0, "W"})
    end

    test "when facing west, rotates to south" do
      {0, 0, "W"}
      |> Rotation.rotate_left
      |> assert_equal({0, 0, "S"})
    end
  end

  describe "rotating right" do
    test "when facing west, rotates to north" do
      {0, 0, "W"}
      |> Rotation.rotate_right
      |> assert_equal({0, 0, "N"})
    end

    test "when facing south, rotates to west" do
      {0, 0, "S"}
      |> Rotation.rotate_right
      |> assert_equal({0, 0, "W"})
    end
  end

  defp assert_equal(got, expect) do
    assert got == expect
  end
end
