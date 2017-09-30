defmodule Rover.Direction do
  @type t :: :N | :S | :W | :E

  defmacro directions() do
    quote do
      [:N, :S, :W, :E]
    end
  end

  defmacro north(), do: quote do: :N
  defmacro south(), do: quote do: :S
  defmacro west(), do: quote do: :W
  defmacro east(), do: quote do: :E
end
