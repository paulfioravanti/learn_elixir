defmodule BankAccount do
  def handle_message({ :deposit, amount }, _from, balance) do
    balance + amount
  end

  def handle_message({ :withdraw, amount }, _from, balance) do
    balance - amount
  end

  def handle_message(:balance, from, balance) do
    send from, { :balance, balance }
    balance
  end
end
