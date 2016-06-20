defmodule Sigils do
  @moduledoc"""
  Sigil-related exercises for Episode 9 of Learn Elixir
  """
  import Kernel, except: [sigil_r: 2]

  @doc"""
  Create a new sigil ~u that will return a list of upcased words from
  the given `content`.

  Returns a list of upcased words.
  """
  def sigil_u(content, _opts) do
    content
    |> String.split
    |> Enum.map(&String.upcase/1)
  end

  @doc"""
  Overrides the ~r sigil to reverse a string rather than have return
  a regular expression.
  """
  def sigil_r(content, _opts) do
    String.reverse(content)
  end

  @doc"""
  A simple method that uses the overidden version of the ~r sigil.

  Returns "olleh".
  """
  def hello_sigil_r do
    ~r/hello/
  end
end
