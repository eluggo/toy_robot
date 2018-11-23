defmodule ToyRobot.Robot do
  defstruct [:position, :facing, :placed]

  def place(x, y, facing) do
    {:ok, %__MODULE__{position: {x, y}, facing: facing, placed: true}}
  end

  def report(robot = %__MODULE__{placed: true}) do
    {:ok,
     "#{elem(robot.position, 0)},#{elem(robot.position, 1)},#{
       robot.facing
       |> to_string()
       |> String.upcase()
     }"}
  end
  def report(robot = %__MODULE__{}), do: {:error, :not_placed}

  def left(robot = %__MODULE__{facing: :north, placed: true}), do: {:ok, %{robot | facing: :west}}
  def left(robot = %__MODULE__{facing: :west, placed: true}), do: {:ok, %{robot | facing: :south}}
  def left(robot = %__MODULE__{facing: :south, placed: true}), do: {:ok, %{robot | facing: :east}}
  def left(robot = %__MODULE__{facing: :east, placed: true}), do: {:ok, %{robot | facing: :north}}
  def left(robot = %__MODULE__{}), do: {:error, :not_placed}

  def right(robot = %__MODULE__{facing: :north, placed: true}), do: {:ok, %{robot | facing: :east}}
  def right(robot = %__MODULE__{facing: :west, placed: true}), do: {:ok, %{robot | facing: :north}}
  def right(robot = %__MODULE__{facing: :south, placed: true}), do: {:ok, %{robot | facing: :west}}
  def right(robot = %__MODULE__{facing: :east, placed: true}), do: {:ok, %{robot | facing: :south}}
  def right(robot = %__MODULE__{}), do: {:error, :not_placed}

  def move(robot = %__MODULE__{facing: :north, position: {x, y}, placed: true}),
    do: {:ok, %{robot | position: {x, y + 1}}}

  def move(robot = %__MODULE__{facing: :west, position: {x, y}, placed: true}),
    do: {:ok, %{robot | position: {x - 1, y}}}

  def move(robot = %__MODULE__{facing: :south, position: {x, y}, placed: true}),
    do: {:ok, %{robot | position: {x, y - 1}}}

  def move(robot = %__MODULE__{facing: :east, position: {x, y}, placed: true}),
    do: {:ok, %{robot | position: {x + 1, y}}}

  def move(robot = %__MODULE__{}), do: {:error, :not_placed}
end
