defmodule Raindrops do
  @rain_map %{
    3 => "Pling",
    5 => "Plang",
    7 => "Plong"
  }
  @doc """
  Returns a string based on raindrop factors.

  - If the number contains 3 as a prime factor, output 'Pling'.
  - If the number contains 5 as a prime factor, output 'Plang'.
  - If the number contains 7 as a prime factor, output 'Plong'.
  - If the number does not contain 3, 5, or 7 as a prime factor,
    just pass the number's digits straight through.
  """
  @spec convert(pos_integer) :: String.t
  def convert(number) do
    conversion = Enum.reduce([3, 5, 7], "", &(check_factor(number, &1, &2)))
    cond do
      String.length(conversion) > 0 -> conversion
      true -> to_string(number)
    end
  end

  defp check_factor(number, factor_to_check, acc) do
    cond do
      rem(number, factor_to_check) == 0 -> acc <> @rain_map[factor_to_check]
      true -> acc <> ""
    end
  end
end
