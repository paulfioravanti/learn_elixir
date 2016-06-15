defmodule MyList do
  @moduledoc"""
  Module that emulates functionality in Elixir's Enum module.
  """

  @doc"""
  Calculates the length of a list

  ## Examples:

      iex> MyList.length([])
      0
      iex> MyList.length([1, 2, 3])
      3
  """
  def length(list), do: do_length(list, 0)

  def each(list, fun), do: do_each(list, fun)

  def map(list, fun), do: do_map(list, fun, [])

  def sum(list), do: do_sum(list, 0)

  def reduce([head | tail], fun), do: do_reduce(tail, fun, head)

  def reverse([head | tail]), do: do_reverse(tail, [head])

  # private

  defp do_length([], count), do: count
  defp do_length([_head | tail], count), do: do_length(tail, count + 1)

  defp do_each([], _fun), do: :ok
  defp do_each([head | tail], fun) do
    fun.(head)
    do_each(tail, fun)
  end

  defp do_map([], _fun, memo), do: :lists.reverse(memo)
  defp do_map([head | tail], fun, memo) do
    result = fun.(head)
    memo = [result | memo]
    do_map(tail, fun, memo)
  end

  defp do_sum([], count), do: count
  defp do_sum([head | tail], count) do
    count = count + head
    do_sum(tail, count)
  end

  defp do_reduce([], _fun, acc), do: acc
  defp do_reduce([head | tail], fun, acc) do
    acc = fun.(head, acc)
    do_reduce(tail, fun, acc)
  end

  defp do_reverse([], acc), do: acc
  defp do_reverse([head | tail], acc) do
    acc = [head | acc]
    do_reverse(tail, acc)
  end
end
