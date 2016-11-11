defmodule PythagoreanTriplet do
  def find_triplet(a \\ 1, b \\ 2) do
    c = :math.pow(a, 2) + :math.pow(b, 2) |> :math.sqrt
    cond do
      a + b + c == 1000.0 -> IO.puts "#{a} * #{b} * #{c} = #{a * b * c}"
      b < 500 -> find_triplet(a, b + 1)
      a < 500 -> find_triplet(a + 1, a + 2)
      true -> IO.puts "I don't know"
    end
  end
end

PythagoreanTriplet.find_triplet
