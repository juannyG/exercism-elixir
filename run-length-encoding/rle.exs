defmodule RunLengthEncoder do
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "HORSE" => "1H1O1R1S1E"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "1H1O1R1S1E" => "HORSE"
  """
  @spec encode(String.t) :: String.t
  def encode("") do
    ""
  end

  def encode(string) do
    [letter | t] = string |> String.to_charlist
    letter_count = count_consecutive_letters(t, letter)
    "#{letter_count}#{[letter]}" <> (split_str(string, letter_count) |> encode)
  end

  defp count_consecutive_letters(t, letter) do
    (t |> Enum.take_while(&(&1 == letter)) |> length) + 1
  end

  defp split_str(string, letter_count) do
    String.split_at(string, letter_count) |> elem(1)
  end

  @spec decode(String.t) :: String.t
  def decode(string) do
    count_letter_pairs = Regex.scan(~r/\d+\w/, string) |> List.flatten
    Enum.reduce(count_letter_pairs, "", &(expand_letter_by_count(&1, &2)))
  end

  defp expand_letter_by_count(count_letter_pair, acc) do
    count = hd(String.split(count_letter_pair, ~r/\D/)) |> String.to_integer
    letter = String.slice(count_letter_pair, -1, 1)
    acc <> Enum.reduce(1..count, "", fn (x, acc2) -> acc2 <> letter end)
  end
end
