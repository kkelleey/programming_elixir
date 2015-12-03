defmodule MyString do
  # assume that word1 and word2 are character lists, not strings
  def is_anagram?(word1, word2) do
    word1 -- word2 == [] && word2 -- word1 == []
  end
end
