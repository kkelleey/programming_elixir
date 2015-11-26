defmodule Chop do
  # Exercise: ModulesAndFunctions-6
  def guess(actual, lower..upper) when lower == upper do
    IO.puts actual
  end

  def guess(actual, lower..upper) do
    current_guess = div(lower + upper, 2)
    IO.puts "Is it #{current_guess}"
    new_range = new_range(actual, lower..upper, current_guess)
    guess(actual, new_range)
  end

  def new_range(actual, lower.._upper, guess) when guess > actual do
    lower..(guess - 1)
  end

  def new_range(actual, _lower..upper, guess) when guess < actual do
    (guess + 1)..upper
  end

  def new_range(_, _, guess) do
    guess..guess
  end
end
