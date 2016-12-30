defmodule NucleotideCount do
  @nucleotides [?A, ?C, ?G, ?T]

  def count(strand, nucleotide) do
    strand |> Enum.count(&(&1 == nucleotide))
  end

  def histogram(strand) do
    @nucleotides |> Map.new(&({&1, count(strand, &1)}))
  end

end
