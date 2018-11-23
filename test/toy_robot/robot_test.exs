defmodule ToyRobot.RobotTest do
  use ExUnit.Case
  alias ToyRobot.Robot

  describe "place/3" do
    test "should place robot on position" do
      assert Robot.place(0, 0, :north) == {:ok, %Robot{position: {0, 0}, facing: :north, placed: true}}
      assert Robot.place(1, 0, :south) == {:ok, %Robot{position: {1, 0}, facing: :south, placed: true}}
      assert Robot.place(1, 1, :east) == {:ok, %Robot{position: {1, 1}, facing: :east, placed: true}}
    end
  end

  describe "report/1" do
    test "should report position" do
      assert Robot.report(%Robot{position: {0, 0}, facing: :north, placed: true}) == {:ok, "0,0,NORTH"}
    end
  end

  describe "left/1" do
    test "should turn left" do
      assert Robot.left(%Robot{position: {0, 0}, facing: :north, placed: true}) == {:ok, %Robot{
               position: {0, 0},
               facing: :west, placed: true
             }}

      assert Robot.left(%Robot{position: {0, 0}, facing: :west, placed: true}) == {:ok, %Robot{
               position: {0, 0},
               facing: :south, placed: true
             }}

      assert Robot.left(%Robot{position: {0, 0}, facing: :south, placed: true}) == {:ok, %Robot{
               position: {0, 0},
               facing: :east, placed: true
             }}

      assert Robot.left(%Robot{position: {0, 0}, facing: :east, placed: true}) == {:ok, %Robot{
               position: {0, 0},
               facing: :north, placed: true
             }}
    end
  end

  describe "right/1" do
    test "should turn right" do
      assert Robot.right(%Robot{position: {0, 0}, facing: :north, placed: true}) == {:ok, %Robot{
               position: {0, 0},
               facing: :east, placed: true
             }}

      assert Robot.right(%Robot{position: {0, 0}, facing: :west, placed: true}) == {:ok, %Robot{
               position: {0, 0},
               facing: :north, placed: true
             }}

      assert Robot.right(%Robot{position: {0, 0}, facing: :south, placed: true}) == {:ok, %Robot{
               position: {0, 0},
               facing: :west, placed: true
             }}

      assert Robot.right(%Robot{position: {0, 0}, facing: :east, placed: true}) == {:ok, %Robot{
               position: {0, 0},
               facing: :south, placed: true
             }}
    end
  end

  describe "move/1" do
    test "should move foward" do
      assert Robot.move(%Robot{position: {0, 0}, facing: :north, placed: true}) == {:ok, %Robot{
               position: {0, 1},
               facing: :north, placed: true
             }}

      assert Robot.move(%Robot{position: {0, 0}, facing: :west, placed: true}) == {:ok, %Robot{
               position: {-1, 0},
               facing: :west, placed: true
             }}

      assert Robot.move(%Robot{position: {0, 0}, facing: :south, placed: true}) == {:ok, %Robot{
               position: {0, -1},
               facing: :south, placed: true
             }}

      assert Robot.move(%Robot{position: {0, 0}, facing: :east, placed: true}) == {:ok, %Robot{
               position: {1, 0},
               facing: :east, placed: true
             }}
    end
  end
end
