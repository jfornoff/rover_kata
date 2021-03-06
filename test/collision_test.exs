defmodule CollisionTest do
  use ExUnit.Case, async: true

  require Rover.Direction
  alias Rover.Direction

  describe "moving rover with no obstacle" do
    test "moves him to the target position" do
      {:ok, new_world} =
        World.empty(10, 10)
        |> World.put_rover(5, 5, Direction.north)
        |> World.RoverMovement.move_rover_forward()
      assert Rover.position(new_world.rover) == {5, 6}
    end
  end

  describe "moving rover with an obstacle in the way" do
    test "does not move rover" do
      result =
        World.empty(10, 10)
        |> World.put_rover(5, 5, Direction.north)
        |> World.put_obstacle(5, 6)
        |> World.RoverMovement.move_rover_forward()

      assert {:err, :collision} = result
    end
  end
end
