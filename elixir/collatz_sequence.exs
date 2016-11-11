defmodule CollatzSequence do
  def calculate_longest_sequence do
    Enum.map(1..1000000, fn (n) -> calculate_sequence n end)
    |> longest_sequence_index
    |> Kernel.+(1)
    |> IO.puts
  end

  defp longest_sequence_index(sequence_lengths) do
    max = Enum.max(sequence_lengths)
    Enum.find_index(sequence_lengths, fn (x) -> x == max end)
  end

  defp calculate_sequence(n, sequence_length \\ 1) do
    case n do
      1 -> sequence_length
      _ -> calculate_sequence(
            calculate(n),
            (sequence_length + 1))
    end
  end

  defp calculate(n) when (rem(n, 2) == 0) do
    div(n, 2)
  end

  defp calculate(n) do
    (n * 3) + 1
  end
end

CollatzSequence.calculate_longest_sequence
