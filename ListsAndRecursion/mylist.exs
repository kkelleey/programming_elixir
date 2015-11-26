defmodule MyList do
  # Exercise: ListsAndRecursion-0
  def sum([]), do: 0

  def sum([head | tail]) do
    head + sum(tail)
  end

  # Exercise: ListsAndRecursion-1
  def mapsum([], _), do: 0

  def mapsum([head | tail], func) do
    func.(head) + mapsum(tail, func)
  end

  # Exercise: ListsAndRecursion-2
  def max([a]), do: a

  def max([head | [tail_head | tail_tail]]) when head > tail_head do
    max([head | tail_tail])
  end

  def max([_ | tail]) do
    max(tail)
  end

  # Exercise: ListsAndRecursion-3
  def caesar([], _), do: []

  def caesar([head | tail], n) when head + n > 122 do
    [head + n - 122 + 96 | caesar(tail, n)]
  end

  def caesar([head | tail], n) do
    [head + n | caesar(tail, n)]
  end
end
