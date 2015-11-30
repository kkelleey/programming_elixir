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

  # Exercise: ListsAndRecursion-4
  def span(from, to) when from == to do
    [from]
  end

  def span(from, to) do
    [from | span(from + 1, to)]
  end

  # Exercise: ListsAndRecursion-5
  def all?([], _), do: true
  def all?([head | tail], func) do
   func.(head) && all?(tail, func)
  end

  def each([], _), do: :ok
  def each([head | tail], func) do
    func.(head)
    each(tail, func)
  end

  def filter([], _), do: []
  def filter([head | tail], func) do
    if func.(head) do
      [head | filter(tail, func)]
    else
      filter(tail, func)
    end
  end

  def split(list, count) when count < 0 do
    _split(list, length(list) + count, [])
  end
  def split(list, count), do: _split(list, count, [])
  defp _split([], _, _), do: []
  defp _split(list, 0, acc), do: [acc, list]
  defp _split([head | tail], count, acc) when count > 0 do
    _split(tail, count - 1, acc ++ [head])
  end

  def take(_, 0), do: []
  def take([head | tail], count) do
    [head | take(tail, count - 1)]
  end

  # Exercise: ListsAndRecursion-6
  def flatten([]), do: []
  def flatten([head | tail]) when is_list(head) do
    flatten(head) ++ flatten(tail)
  end
  def flatten([head | tail]) do
    [head | flatten(tail)]
  end

  # Exercise: ListsAndRecursion-7
  def primes(2, n) do
    non_primes = for x <- span(2,n), y <- span(2,n), x > y, rem(x, y) == 0, do: x
    span(2,n) -- non_primes
  end

  # Exercise: ListsAndRecursion-8
  # tax_rates = [ NC: 0.075, TX: 0.08]
  # orders = [
  #   [id: 123, ship_to: :NC, net_amount: 100.00 ],
  #   [ id: 124, ship_to: :OK, net_amount: 35.50 ],
  #   [ id: 125, ship_to: :TX, net_amount: 24.00 ],
  #   [ id: 126, ship_to: :TX, net_amount: 44.80 ],
  #   [ id: 127, ship_to: :NC, net_amount: 25.00 ],
  #   [ id: 128, ship_to: :MA, net_amount: 10.00 ],
  #   [ id: 129, ship_to: :CA, net_amount: 102.00 ],
  #   [ id: 130, ship_to: :NC, net_amount: 50.00 ] ]

  def orders_with_total_amt(orders, tax_rates) do
    for order <- orders do
      tax_rate = Dict.get(tax_rates, order[:ship_to], 0)
      total_amount = order[:net_amount] * ( 1 + tax_rate )
      Dict.put_new(order, :total_amount, total_amount)
    end
  end
end
