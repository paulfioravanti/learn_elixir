defmodule Todo.Cache do
  use GenServer
  import String, only: [to_atom: 1]
  alias __MODULE__, as: Cache

  def save(list) do
    :ets.insert(Cache, {to_atom(list.name), list})
  end

  def find(list_name) do
    case :ets.lookup(Cache, to_atom(list_name)) do
      [{_id, value}] -> value
      [] -> nil
    end
  end

  def clear do
    :ets.delete_all_objects(Cache)
  end

  ###
  # GenServer API
  ###

  def start_link do
    GenServer.start_link(Cache, [], name: Cache)
  end

  def init(_) do
    table = :ets.new(Cache, [:named_table, :public])
    {:ok, table}
  end
end
