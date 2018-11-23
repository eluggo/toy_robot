defmodule ToyRobot.RobotTest do
  use ExUnit.Case
  alias ToyRobot.Robot

  describe "place/3" do
    test "should place robot on position" do
      assert Robot.place(0, 0, :north) == %Robot{position: {0, 0}, facing: :north}
      assert Robot.place(1, 0, :south) == %Robot{position: {1, 0}, facing: :south}
      assert Robot.place(1, 1, :east) == %Robot{position: {1, 1}, facing: :east}
    end
  end

  describe "report/1" do
    test "should report position" do
      assert Robot.report(%Robot{position: {0, 0}, facing: :north}) == "0,0,NORTH"
    end
  end

  describe "left/1" do
    test "should turn left" do
      assert Robot.left(%Robot{position: {0, 0}, facing: :north}) == %Robot{
               position: {0, 0},
               facing: :west
             }

      assert Robot.left(%Robot{position: {0, 0}, facing: :west}) == %Robot{
               position: {0, 0},
               facing: :south
             }

      assert Robot.left(%Robot{position: {0, 0}, facing: :south}) == %Robot{
               position: {0, 0},
               facing: :east
             }

      assert Robot.left(%Robot{position: {0, 0}, facing: :east}) == %Robot{
               position: {0, 0},
               facing: :north
             }
    end
  end

  describe "right/1" do
    test "should turn right" do
      assert Robot.right(%Robot{position: {0, 0}, facing: :north}) == %Robot{
               position: {0, 0},
               facing: :east
             }

      assert Robot.right(%Robot{position: {0, 0}, facing: :west}) == %Robot{
               position: {0, 0},
               facing: :north
             }

      assert Robot.right(%Robot{position: {0, 0}, facing: :south}) == %Robot{
               position: {0, 0},
               facing: :west
             }

      assert Robot.right(%Robot{position: {0, 0}, facing: :east}) == %Robot{
               position: {0, 0},
               facing: :south
             }
    end
  end

  describe "move/1" do
    test "should move foward" do
      assert Robot.move(%Robot{position: {0, 0}, facing: :north}) == %Robot{
               position: {0, 1},
               facing: :north
             }

      assert Robot.move(%Robot{position: {0, 0}, facing: :west}) == %Robot{
               position: {-1, 0},
               facing: :west
             }

      assert Robot.move(%Robot{position: {0, 0}, facing: :south}) == %Robot{
               position: {0, -1},
               facing: :south
             }

      assert Robot.move(%Robot{position: {0, 0}, facing: :east}) == %Robot{
               position: {1, 0},
               facing: :east
             }
    end
  end
end
