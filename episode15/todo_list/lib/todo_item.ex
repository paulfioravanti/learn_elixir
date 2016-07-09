defmodule TodoItem do
  @enforce_keys [:name]
  defstruct [:name, :description]
end
