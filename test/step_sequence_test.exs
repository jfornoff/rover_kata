defmodule StepSequenceTest do
  use ExUnit.Case, async: true

  describe "step sequence with no Rover added to the world" do
    test "returns an error" do
      result =
        World.empty(10, 10)
        |> World.RoverMovement.execute_sequence("F")

      assert(result == {:err, :no_rover})
    end
  end

  describe "0-step sequence" do
    test "test name" do
      {:ok, world} =
        World.empty(10, 10)
        |> World.put_rover(5, 5, "N")
        |> World.RoverMovement.execute_sequence("")

      assert(Rover.position(world.rover) == {5, 5})
    end
  end

  describe "simple step sequence" do
    test "moves Rover forward twice" do
      {:ok, new_world} =
        World.empty(10, 10)
        |> World.put_rover(5, 5, "N")
        |> World.RoverMovement.execute_sequence("FF")

      assert(Rover.position(new_world.rover) == {7, 5})
    end
  end

  describe "sequence including turns" do
    {:ok, new_world} =
      World.empty(10, 10)
      |> World.put_rover(5, 5, "N")
      |> World.RoverMovement.execute_sequence("FLFFRF")

    assert(Rover.position(new_world.rover) == {7, 3})
  end

  describe "sequence for driving a circle" do
    test "turning left" do
      {:ok, new_world} =
        World.empty(10, 10)
        |> World.put_rover(5, 5, "N")
        |> World.RoverMovement.execute_sequence("FLFLFLF")

      assert(Rover.position(new_world.rover) == {5, 5})
    end

    test "turning right" do
      {:ok, new_world} =
        World.empty(10, 10)
        |> World.put_rover(5, 5, "N")
        |> World.RoverMovement.execute_sequence("FRFRFRF")

      assert(Rover.position(new_world.rover) == {5, 5})
    end
  end

  describe "sequence that includes hitting an obstacle" do
    test "returns a {:stopped, :collision} message" do
      result =
        World.empty(10, 10)
        |> World.put_rover(5, 5, "N")
        |> World.put_obstacle(6, 5)
        |> World.RoverMovement.execute_sequence("F")

      assert({:stopped, :collision} = result)
    end
  end
end
