defmodule Todo.Item do
  alias __MODULE__

  defstruct id: nil, description: nil, completed: false

  def new(description) do
    %Item{id: :rand.uniform(1_000_000_000), description: description}
  end
end
