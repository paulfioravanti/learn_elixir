defmodule Speaker do
  @moduledoc"""
  A change to the Speaker module from episode 13: re-written to
  act more like it will be used with a GenServer.

  ## Original code for the `speak` method:

      def speak do
        receive do
          { :say, msg } ->
            IO.puts(msg)
            speak
          _other ->
            speak # throw away the message
        end
      end
  """


  @doc"""
  Receives a message and either prints it to screen it
  the message is a `:say` tuple, otherwise ignores it

  """
  def handle_message({ :say, msg }), do: IO.puts(msg)
  def handle_message(_other), do: false
end
