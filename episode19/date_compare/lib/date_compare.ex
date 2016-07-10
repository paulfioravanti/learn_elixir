defmodule DateCompare do
  @doc "Determines if date1 is greater than date2"
  def gt(date1, date2) do
    # to_i(date1) > to_i(date2)
    DateCompareable.to_i(date1) > DateComparable.to_i(date2)
  end

  # defp to_i(date) when is_tuple(date) do
  #   :calendar.datetime_to_gregorian_seconds(date)
  # end

  # defp to_i(%Ecto.DateTime{} = date) do
  #   date
  #   |> Ecto.DateTime.to_erl
  #   |> :calendar.datetime_to_gregorian_seconds
  # end
end
