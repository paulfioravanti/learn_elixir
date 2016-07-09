defmodule Server do
  @moduledoc"""
  A module to learn about how GenServers work in
  Learning Elixir episode 14.
  """

  @doc"""
  Spawns off a process for a server where messages can
  be sent.  Process receives a message, prints the
  response to stdout, and returns the message sent.

  ## Examples:

  ### Speaker (specifically)

      iex> server = Server.start(Speaker)
      ...> send server, { :say, "Hello" }
      "Hello"
      { :say, "Hello" }

  ### PingPong

      iex> server = Server.start(PingPong)
      ...> send server, :ping
      pong
      :ping
      ...> send server, :pong
      ping
      :pong

  """
  def start(Speaker) do
    spawn(fn ->
      loop(Speaker)
    end)
  end
  def start(callback_module) do
    parent = self
    spawn fn ->
      loop(callback_module, parent)
    end
  end
  def start(callback_module, state) do
    parent = self
    spawn fn ->
      loop(callback_module, parent, state)
    end
  end

  defp loop(Speaker) do
    receive do
      message ->
        Speaker.handle_message(message)
    end
    loop(Speaker)
  end
  defp loop(callback_module, parent) do
    receive do
      message ->
        callback_module.handle_message(message, parent)
        |> IO.puts
    end
    loop(callback_module, parent)
  end
  defp loop(callback_module, parent, state) do
    receive do
      message ->
        state = callback_module.handle_message(message, parent, state)
        IO.puts state
        loop(callback_module, parent, state)
    end
  end
end
