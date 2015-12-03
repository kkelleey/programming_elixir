defmodule MyString do
  def only_printable([]), do: true

  def only_printable([head | tail]) when ' ' < head < '~' do
    only_printable(tail)
  end

  def only_printable(_), do: false
end
