defmodule Status do
  def ok!(param) do
    case param do
      {:ok, data} -> data
      { _, error } -> raise "#{error}"
    end
  end
end
