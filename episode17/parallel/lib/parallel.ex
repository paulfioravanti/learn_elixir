defmodule Parallel do
  @moduledoc"""
  Example module demonstrating parallel processes from Learn Elixir
  Episode 13, refactored in Episode 17 to use `Task`.
  """

  @doc"""
  Parallel map function that takes in a `collection` and `fun`
  function and performs a function call on each member of the
  collection in a separate process.

  Returns a collection of values

  Examples:

      iex> Parallel.pmap(1..10, &(&1 * &1))
      [1, 4, 9, 16, 25, 36, 49, 64, 81, 100]
  """
  def pmap(collection, fun) do
    collection
    # |> Enum.map(&spawn_process(&1, self, fun))
    |> Enum.map(&Task.async(fn -> fun.(&1) end))
    # |> Enum.map(&await/1)
    |> Enum.map(&Task.await/1)
  end

  # defp spawn_process(item, parent, fun) do
  #   spawn_link fn ->
  #     send parent, { self, fun.(item) }
  #   end
  # end

  # defp await(pid) do
  #   receive do
  #     { ^pid, result } -> result
  #   end
  # end
end
