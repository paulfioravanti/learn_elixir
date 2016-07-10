defmodule YourApp.Event do
  def start_link do
    GenEvent.start_link(name: __MODULE__)
  end

  def notify(event) do
    GenEvent.notify(__MODULE__, event)
  end
end
