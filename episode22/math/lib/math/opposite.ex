defmodule Math.Opposite do
  defmacro opposite({ :+, _context, [a, b] }) do
    quote do
      unquote(a) - unquote(b)
    end
  end

  defmacro opposite({ :*, _context, [a, b] }) do
    quote do
      unquote(a) / unquote(b)
    end
  end

  # defmacro opposite({ :+, context, [a, b] }) do
  #   { :-, context, [a, b] }
  # end

  # def opposite(:+, [a, b]) do
  #   a - b
  # end
end
