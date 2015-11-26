defmodule Math do
  # Exercise: ModulesAndFunctions-4
  def sum(1), do: 1
  def sum(n), do: n + sum(n-1)

  # Exercise: ModulesAndFunctions-5
  def gcd(x,0), do: x
  def gcd(x,y), do: gcd(y, rem(x,y))
end
