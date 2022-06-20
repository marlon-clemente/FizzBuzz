defmodule FizzBuzz do
  def build(file_name) do
    file_name
    |> File.read()
    |> handle_file_read()
  end

  defp handle_file_read({:ok , result}) do

    result = result
    |> String.split(",")
    |> Enum.map(&convert_and_evaluate_number/1)

    {:ok, result}
  end

  defp handle_file_read({:error , reason}), do: {:error, "Error reading the file: #{reason}"}

  defp convert_and_evaluate_number(element) do
    element
    |> String.to_integer()
    |> elavuate_number()
  end

  defp elavuate_number(number) when rem(number, 5) == 0 and rem(number, 3) == 0, do: :fizzbuzz
  defp elavuate_number(number) when rem(number, 3) == 0, do: :fizz
  defp elavuate_number(number) when rem(number, 5) == 0, do: :buzz
  defp elavuate_number(number), do: number
end
