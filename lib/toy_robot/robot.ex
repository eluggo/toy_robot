defmodule ToyRobot.Robot do
  defstruct [:position, :facing]

  def place(x, y, facing) do
    %__MODULE__{position: {x, y}, facing: facing}
  end

  def report(robot = %__MODULE__{}) do
    "#{elem(robot.position, 0)},#{elem(robot.position, 1)},#{
      robot.facing
      |> to_string()
      |> String.upcase()
    }"
  end

  def left(robot = %__MODULE__{facing: :north}), do: %{robot | facing: :west}
  def left(robot = %__MODULE__{facing: :west}), do: %{robot | facing: :south}
  def left(robot = %__MODULE__{facing: :south}), do: %{robot | facing: :east}
  def left(robot = %__MODULE__{facing: :east}), do: %{robot | facing: :north}

  def right(robot = %__MODULE__{facing: :north}), do: %{robot | facing: :east}
  def right(robot = %__MODULE__{facing: :west}), do: %{robot | facing: :north}
  def right(robot = %__MODULE__{facing: :south}), do: %{robot | facing: :west}
  def right(robot = %__MODULE__{facing: :east}), do: %{robot | facing: :south}

  def move(robot = %__MODULE__{facing: :north, position: {x, y}}),
    do: %{robot | position: {x, y + 1}}

  def move(robot = %__MODULE__{facing: :west, position: {x, y}}),
    do: %{robot | position: {x - 1, y}}

  def move(robot = %__MODULE__{facing: :south, position: {x, y}}),
    do: %{robot | position: {x, y - 1}}

  def move(robot = %__MODULE__{facing: :east, position: {x, y}}),
    do: %{robot | position: {x + 1, y}}
end
