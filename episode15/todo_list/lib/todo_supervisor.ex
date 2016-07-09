defmodule TodoSupervisor do
  use Supervisor

  def start_link do
    Supervisor.start_link(__MODULE__, [])
  end

  def init([]) do
    children = [
      worker(TodoList, :start, []),
    ]
    supervise(children, strategy: :one_for_one)
  end
end
