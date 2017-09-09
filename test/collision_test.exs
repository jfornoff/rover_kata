defmodule CollisionTest do
  use ExUnit.Case, async: true

  describe "moving rover with no obstacle" do
    test "moves him to the target position" do
      {:ok, new_world} =
        World.empty(10, 10)
        |> World.put_rover(5, 5, "N")
        |> World.RoverMovement.move_rover_forward

      assert(Rover.position(new_world.rover) == {6, 5})
    end
  end

  describe "moving rover with an obstacle in the way" do
    test "does not move rover" do
      result =
        World.empty(10, 10)
        |> World.put_rover(5, 5, "N")
        |> World.put_obstacle(6, 5)
        |> World.RoverMovement.move_rover_forward

      assert({:err, :collision} = result)
    end
  end
end
