defmodule Bob do
  def hey(input) do
    cond do
        is_silence(input) -> "Fine. Be that way!"
        is_a_question(input) -> "Sure."
        is_shouting(input) -> "Whoa, chill out!"
        true -> "Whatever."
    end
  end

  defp is_silence(input) do
    String.trim(input) == ""
  end

  defp is_a_question(input) do
    String.ends_with?(input, "?")
  end

  defp is_shouting(input) do
    String.match?(input, ~r/[\p{L}]/)and String.upcase(input) == input
  end
end
