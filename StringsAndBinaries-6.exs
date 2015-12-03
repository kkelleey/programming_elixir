defmodule Capitalize do
  def capitalize_sentences(string) do
    String.split(string, ". ")
    |> Enum.map(&(String.capitalize(&1)))
    |> Enum.join(". ")
  end
end
