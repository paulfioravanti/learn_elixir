defmodule Speaker do
  @doc"""
  An example method to learn how to use the `receive` macro.

  ## Examples:

      iex> pid = Kernel.spawn(Speaker, :speak, [])
      ...> send(pid, { :say, "Hello" })
      { :say, "Hello" }
      ...> send(pid, { :message, "Hello" })
      { :message, "Hello" }
  """
  def speak do
    receive do
      { :say, msg } ->
        IO.puts(msg)
        speak
      _other ->
        speak # throw away the message
    end
  end
end
