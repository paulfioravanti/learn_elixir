defmodule YourApp.StatisticsCounter do
  use GenEvent

  def init(_) do
    stats = %{ deaths: 0, kills: 0 }
    { :ok, stats }
  end

  def handle_event({ :player, :died }, stats) do
    stats = %{ stats | deaths: stats.deaths + 1 }
    { :ok, stats }
  end

  def handle_event({ :player, :killed }, stats) do
    stats = %{ stats | kills: stats.kills + 1 }
    { :ok, stats }
  end

  def handle_event(_other, stats) do
    { :ok, stats }
  end
end
