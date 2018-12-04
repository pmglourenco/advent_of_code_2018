defmodule Day1 do
  @moduledoc """
    Day 1 of advent of code
    This exercise is to load a number of deltas represented by -1, +1, ... and calculate the sum of those deltas
  """
  
  @doc """
    This function gets the the list of deltas from a file, transforms them into integers and them sums them.
    The goal is to reduce the deltas into one value only given a list. So if our deltas are -1, +1, +2 our result should be 3.
  """
  def sum_deltas(path) do
    load_file(path)
    |> sanitize_list
    |> Enum.sum
    |> IO.puts
  end

  defp load_file(path) do
    {:ok, body} = File.read(path)
    body
  end

  defp sanitize_list(body) do
    #    IO.puts body
    String.split(body, "\n", trim: true)
    |> Enum.map(&String.to_integer/1)
  end

  @doc """
    This exercise now is to find the first time a frequency is found duplicated by summing the deltas
  """
  def frequency_repeat(path) do
    load_file(path)
    |> sanitize_list
    |> find_repeat_frequency
    |> IO.puts
  end 

  defp find_repeat_frequency(list), do: find_repeat_frequency(list, [], 0, list)
  defp find_repeat_frequency([], seen, freq, list), do: find_repeat_frequency(list, seen, freq, list)
  defp find_repeat_frequency([head | tail], seen, freq, list) do
    if Enum.member?(seen, freq) do 
      freq
    else
      find_repeat_frequency(tail, [freq | seen], freq + head, list)
    end
  end
end

#Day1.sum_deltas("./inputs/day-1-part-1.txt")
Day1.frequency_repeat("./inputs/day-1-part-1.txt")
