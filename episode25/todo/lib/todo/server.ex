defmodule Todo.Server do
  use Supervisor

  ###
  # Supervisor API
  ##

  def start_link do
    Supervisor.start_link(__MODULE__, [], name: __MODULE__)
  end

  def init(_) do
    children = [
      # `restart: :transient` only restarts due to an error,
      # not if they are shutdown manually.
      # This worker used as a template process to start children
      # for the server process
      worker(Todo.List, [], restart: :transient)
    ]

    # :simple_one_for_one strategy used when you're going
    # to add children dynamically to a supervisor
    supervise(children, strategy: :simple_one_for_one)
  end
end
