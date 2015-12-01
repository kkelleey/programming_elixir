defmodule MyString do
  def center(list) do
    max_characters = Enum.map(list, &String.length/1) |> Enum.max
    for word <- list do
      number_of_spaces = (max_characters - String.length(word)) |> div(2)
      spaces = String.duplicate(" ", number_of_spaces)
      IO.puts "#{spaces}#{word}"
    end
  end
end
