defmodule Crypto.Encryptor do
  # @prefix Application.get_env(:crypto, :prefix)
  @prefix Application.get_env(:crypto, __MODULE__)[:prefix]

  def encrypt(text) do
    @prefix <> String.reverse(text)
  end
end
