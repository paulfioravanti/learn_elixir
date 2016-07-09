defmodule BankAccount do
  # NOTE: Commented out code refers to version of BankAccount
  # that uses GenServer explicitly in calls ie:
  # iex> { :ok, account } = GenServer.start(BankAccount, 0)
  # ...> GenServer.cast(account, { :deposit, 50 })
  # ...> GenServer.cast(account, { :withdrawal, 25 })
  # ...> balance = GenServer.call(account, :balance)
  # => 25

  # use GenServer

  # NOTE: The following commented out code for BankAccount is just
  # a different implementation using a struct

  # defstruct balance: 0

  # def new(balance) do
  #   %__MODULE__{ balance: balance }
  # end

  # def deposit(account, amount) do
  #   %{ account | balance: account.balance + amount }
  # end

  # def deposit(account, amount) do
  #   %{ account | balance: account.balance - amount }
  # end

  # def balance(account) do
  #   account.balance
  # end

  def start(balance) do
    { :ok, account } = GenServer.start(__MODULE__, balance)
    account
  end

  def deposit(account, amount) do
    GenServer.cast(account, { :deposit, amount })
  end

  def withdraw(account, amount) do
    GenServer.cast(account, { :withdraw, amount })
  end

  def balance(account) do
    GenServer.call(account, :balance)
  end

  # GenServer callbacks

  def init(balance) do
    { :ok, balance }
  end

  def handle_cast({ :deposit, amount }, balance) do
    { :noreply, balance + amount }
  end

  def handle_cast({ :withdraw, amount }, balance) do
    { :noreply, balance - amount }
  end

  def handle_call(:balance, _from, balance) do
    { :reply, balance, balance }
  end
end
