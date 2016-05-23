defmodule User do
  defstruct name: nil, email: nil

  def first_name(user) do
    user.name
    |> String.split
    |> List.first
  end

  def last_name(user) do
    user.name
    |> String.split
    |> List.last
  end
end
