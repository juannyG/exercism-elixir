defmodule NucleotideCount do
  @nucleotides [?A, ?C, ?G, ?T]

  @doc """
  Counts individual nucleotides in a NucleotideCount strand.

  ## Examples

  iex> NucleotideCount.count('AATAA', ?A)
  4

  iex> NucleotideCount.count('AATAA', ?T)
  1
  """
  @spec count([char], char) :: non_neg_integer
  def count(strand, nucleotide) do
    histogram(strand)[nucleotide]
  end


  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> NucleotideCount.histogram('AATAA')
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """
  @spec histogram([char]) :: map
  def histogram(strand) do
    Map.new(@nucleotides, &({&1, count_nucleotide(strand, &1)}))
  end

  defp count_nucleotide(strand, nucleotide) when strand == [] do
    0
  end

  defp count_nucleotide(strand, nucleotide) do
    if (hd(strand) == nucleotide) do
      count_nucleotide(tl(strand), nucleotide) + 1
    else
      count_nucleotide(tl(strand), nucleotide)
    end
  end
end
