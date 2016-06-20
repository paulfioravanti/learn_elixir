defmodule Comprehensions do
  @moduledoc"""
  Exercises module for Episode 08 of "Learn Elixir"
  """

  @doc"""
  Returns all the even numbers up to a given `number`.

  Returns a list of numbers.

  ## Examples:

      iex> Comprehensions.even(0)
      []
      iex> Comprehensions.even(1)
      []
      iex> Comprehensions.even(3)
      [2]
      iex> Comprehensions.even(10)
      [2, 4, 6, 8, 10]
  """
  def even(number) do
    for n <- 1..number, n > 0, rem(n, 2) == 0, do: n
  end

  @doc"""
  Joins a `list` of binaries together with a `separator`

  Returns a binary.

  ## Examples:

      iex> Comprehensions.join(["episodes", "08-comprehensions"], "/")
      "/episodes/08-comprehensions"
  """
  def join(list, separator) do
    for item <- list, into: "", do: "#{separator}#{item}"
  end
end
