defmodule Todo.Server do
  use Supervisor
  alias __MODULE__, as: Server

  def add_list(name) do
    Supervisor.start_child(Server, [name])
  end

  def find_list(name) do
    Enum.find lists, fn(child) ->
      Todo.List.name(child) == name
    end
  end

  def lists do
    __MODULE__
    |> Supervisor.which_children
    |> Enum.map(fn({_, child, _, _}) -> child end)
  end

  def delete_list(list) do
    Supervisor.terminate_child(Server, list)
  end

  ###
  # Supervisor API
  ##

  def start_link do
    Supervisor.start_link(Server, [], name: Server)
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
