defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    string
    |> String.split
    |> Enum.reduce("", &(abbreviate_word(&1, &2)))
    |> String.upcase
  end

  defp abbreviate_word(word, acc) do
    acc = acc <> String.at(word, 0)
    acc <> (word
      |> String.slice(1..-1)
      |> String.split(~r/\p{Ll}/u)
      |> List.to_string
      |> String.replace(~r/[^\p{L} ]/u, ""))
  end
end
