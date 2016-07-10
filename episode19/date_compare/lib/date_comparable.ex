defprotocol DateComparable do
  @doc "Converts a date to Gregorian seconds"
  def to_i(date)
end

defimpl DateComparable, for: Tuple do
  defp to_i(date) do
    :calendar.datetime_to_gregorian_seconds(date)
  end
end

defimpl DateComparable, for: Ecto.DateTime do
  defp to_i(date) do
    date
    |> Ecto.DateTime.to_erl
    |> :calendar.datetime_to_gregorian_seconds
  end
end
