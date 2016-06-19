defmodule MyList do
  @moduledoc"""
  Module that emulates functionality in Elixir's Enum module.
  Created for Learn Elixir screencast series episode 06 - Recursion
  """

  @doc"""
  Calculates the length of a given `list`.

  Returns the length of the `list` as an integer.

  ## Examples:

      iex> MyList.length([])
      0
      iex> MyList.length([1, 2, 3])
      3
  """
  def length(list), do: do_length(list, 0)

  @doc"""
  Iterates over the contents of a given `list` and performs a
  function on each element of the `list`.

  Returns `:ok`.

  ## Examples:

      iex> MyList.each([], fn(x) -> x end)
      :ok
      iex> MyList.each([1, 2, 3], fn(num) ->
      ...>   IO.puts to_string(num)
      ...> end)
      #=> "1"
      #=> "2"
      #=> "3"
      :ok
  """
  def each(list, fun), do: do_each(list, fun)

  @doc"""
  Iterates over the contents of a given `list`, performs a
  function on each element of the `list`, and returns a new
  list with the results.

  Returns a list of results based on calling function `fun`
  on each member of the given `list`.

  ## Examples:

      iex> MyList.map([], fn(x) -> x end)
      []
      iex> MyList.map([1, 2, 3], fn(n) -> n * 2 end)
      [2, 4, 6]
  """
  def map(list, fun), do: do_map(list, fun, [])

  @doc"""
  Sums the elements of a given `list`.

  Returns the sum total of the `list` elements as an integer.

  ## Examples:

      iex> MyList.sum([])
      0
      iex> MyList.sum([1, 2, 3])
      6
  """
  def sum(list), do: do_sum(list, 0)

  @doc"""
  Iterates over the contents of a given `list`, performs a
  function `fun` on each element of the `list`, and returns the
  result of recursively processing the return value of each of the
  function calls.

  Returns a result based on calling function `fun` on each member
  of the given `list` as an integer.

  ## Examples:

      iex> MyList.reduce([], fn(n, acc) -> acc + n end)
      nil
      iex> MyList.reduce([2], fn(_x, acc) -> acc + 5 end)
      2
      iex> MyList.reduce([1, 2, 3, 4], fn(n, acc) -> acc + n end)
      10
      iex> MyList.reduce([1, 2, 3, 4], fn(n, acc) -> acc * n end)
      24
  """
  def reduce(list, fun), do: do_reduce(list, fun)

  @doc"""
  Reverses the contents of a given `list`.

  Returns a list.

  ## Examples:

      iex> MyList.reverse([])
      []
      iex> MyList.reverse([1])
      [1]
      iex> MyList.reverse([1, 2, 3])
      [3, 2, 1]
      iex> MyList.reverse(["a", "b", "c"])
      ["c", "b", "a"]
  """
  def reverse(list), do: do_reverse(list)

  # private

  defp do_length([], count), do: count
  defp do_length([_head | tail], count), do: do_length(tail, count + 1)

  defp do_each([], _fun), do: :ok
  defp do_each([head | tail], fun) do
    fun.(head)
    do_each(tail, fun)
  end

  defp do_map([], _fun, acc), do: :lists.reverse(acc)
  defp do_map([head | tail], fun, acc) do
    result = fun.(head)
    acc = [result | acc]
    do_map(tail, fun, acc)
  end

  defp do_sum([], count), do: count
  defp do_sum([head | tail], count) do
    count = count + head
    do_sum(tail, count)
  end

  defp do_reduce([], _fun), do: nil
  defp do_reduce([head | nil], _fun), do: head
  defp do_reduce([head | tail], fun), do: do_reduce(tail, head, fun)

  defp do_reduce([], acc, _fun), do: acc
  defp do_reduce([head | tail], acc, fun) do
    acc = fun.(head, acc)
    do_reduce(tail, acc, fun)
  end

  defp do_reverse([]), do: []
  defp do_reverse([head | tail]), do: do_reverse(tail, [head])

  defp do_reverse([], acc), do: acc
  defp do_reverse([head | tail], acc) do
    acc = [head | acc]
    do_reverse(tail, acc)
  end
end
