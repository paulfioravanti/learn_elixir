defmodule TodoList do
  def start_link(list) do
    { :ok, todo_list } = GenServer.start(__MODULE__, list)
    todo_list
  end

  def add_item(list, item) do
    GenServer.cast(list, { :add, item })
  end

  def remove_item(list, item_name) do
    GenServer.cast(list, { :remove, item_name })
  end

  def show(list) do
    GenServer.call(list, :show)
  end

  # GenServer callbacks

  def init(list) do
    { :ok, list }
  end

  def handle_cast({ :add, item }, list) do
    { :noreply, [item | list] }
  end

  def handle_cast({ :remove, item_name }, list) do
    index =
      Enum.find_index(list, fn(item) ->
        item.name == item_name
      end)
    { :noreply, List.delete_at(list, index) }
  end

  def handle_call(:show, _from, list) do
    { :reply, list, list }
  end
end
