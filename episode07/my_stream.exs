defmodule MyStream do
  @moduledoc"""
  Exercises for Learn Elixir episode 7
  """

  @doc """
  Create a Stream of all the months in a year.
  """
  # MyStream.months |> Stream.run
  def months do
    ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
    |> Stream.each(&IO.puts/1)
  end

  @doc """
  Write a function that returns every other word in the sample.txt file
  which starts with “D”, sorted by length and capitalized.
  """
  def sample do
    File.stream!("sample.txt")
    |> Stream.take_every(2)
    |> Stream.map(&String.strip/1)
    |> Stream.map(&String.capitalize/1)
    |> Stream.filter(&String.starts_with?(&1, "D"))
    |> Enum.sort_by(&String.length/1)
  end
end
