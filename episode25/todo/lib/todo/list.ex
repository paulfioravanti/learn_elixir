defmodule Todo.List do
  use GenServer

  @type t :: pid
  @type state :: %{
    name: String.t,
    items: [Todo.Item.t]
  }

  @spec name(t) :: String.t
  def name(list) do
    GenServer.call(list, :name)
  end

  @spec items(t) :: [Todo.Item.t]
  def items(list) do
    GenServer.call(list, :items)
  end

  @spec add(t, TodoItem.t) :: :ok
  def add(list, item) do
    GenServer.cast(list, { :add, item })
  end

  @spec update(t, TodoItem.t) :: :ok
  def update(list, item) do
    GenServer.cast(list, { :update, item })
  end

  ###
  # GenServer API
  # No @specs written as they're essentially `private` functions
  # that won't be called from outside this module
  ###

  def start_link(name) do
    GenServer.start_link(__MODULE__, name)
  end

  def init(name) do
    state = %{ name: name, items: [] }
    { :ok, state }
  end

  def handle_call(:items, _from, state) do
    { :reply, state.items, state }
  end

  def handle_cast({ :add, item }, state) do
    # state becomes the current state updated
    # with the new item put to the front
    state = %{ state | items: [item | state.items] }
    { :noreply, state }
  end

  def handle_cast({ :update, item }, state) do
    index = Enum.find_index(state.items, &(&1.id == item.id))
    items = List.replace_at(state.items, index, item)
    state = %{ state | items: items }
    { :noreply, state }
  end
end
