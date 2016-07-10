defmodule CustomException do
  defexception code: nil, message: nil

  # Calls MyCustomException.exception
  # raise MyCustomException, value
  def exception(value) do
    msg = "A custom exception was raised because of #{value}"
    %__MODULE__{ message: msg }
  end
end
