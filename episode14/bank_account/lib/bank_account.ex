defmodule BankAccount do
  use GenServer

  def init(balance) do
    { :ok, balance }
  end

  def handle_cast({ :deposit, amount }, balance) do
    { :noreply, balance + amount }
  end

  def handle_cast({ :withdrawal, amount }, balance) do
    { :noreply, balance - amount }
  end

  def handle_call(:balance, _from, balance) do
    { :reply, balance, balance }
  end
end
