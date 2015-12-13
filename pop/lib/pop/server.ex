defmodule Pop.Server do
  use GenServer

  ###
  # External API

  def start_link(current_list) do
    GenServer.start_link(__MODULE__, current_list, name: __MODULE__)
  end

  def pop do
    GenServer.call __MODULE__, :pop
  end

  def push(value) do
    GenServer.cast __MODULE__, { :push, value }
  end

  def handle_call(:pop, _from, [head | tail]) do
    { :reply, head, tail }
  end

  def handle_cast({:push, value}, stack) do
    {:noreply, [ value | stack] }
  end

  def terminate(reason, state) do
    IO.puts "#{reason} #{state}"
  end
end
