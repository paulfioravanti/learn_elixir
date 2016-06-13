defmodule MyList do
  def length(list) do
    length(list, 0)
  end

  def each([], _fun) do
    :ok
  end

  def each([head | tail], fun) do
    fun.(head)
    each(tail, fun)
  end

  def map(list, fun) do
    map(list, fun, [])
  end

  def sum(list) do
    sum(list, 0)
  end

  def reduce([head | tail], fun) do
    reduce(tail, fun, head)
  end

  defp sum([], count) do
    count
  end

  defp sum([head | tail], count) do
    count = count + head
    sum(tail, count)
  end

  defp reduce([], _fun, acc) do
    acc
  end

  defp reduce([head | tail], fun, acc) do
    acc = fun.(head, acc)
    reduce(tail, fun, acc)
  end

  defp length([], count) do
    count
  end

  defp length([_head | tail], count) do
    length(tail, count + 1)
  end

  defp map([], _fun, memo) do
    :lists.reverse(memo)
  end

  defp map([head | tail], fun, memo) do
    result = fun.(head)
    memo = [result | memo]
    map(tail, fun, memo)
  end
end
