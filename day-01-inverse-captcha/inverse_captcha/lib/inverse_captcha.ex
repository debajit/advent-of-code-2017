defmodule InverseCaptcha do
  @moduledoc """
  Solves the Inverse Captcha problem.
  http://adventofcode.com/2017/day/1

  Run with:

      mix
      ./inverse_captcha 1122
  """

  def solve_captcha(string) do
    string
    |> string_to_list
    |> sum_of_digits_matching_next
  end

  @doc """
      iex> string_to_list("1122")
      [1, 1, 2, 2]
  """
  defp string_to_list(string) do
    string
    |> String.splitter("", trim: true)
    |> Stream.map(& String.to_integer(&1))
    |> Enum.to_list
  end

  @doc """
  ## Examples

      iex> sum_of_digits_matching_next([1, 1, 2, 2])
      3

      iex> sum_of_digits_matching_next([1, 1, 1, 1])
      4

      iex> sum_of_digits_matching_next([1, 2, 3, 4])
      0

      iex> sum_of_digits_matching_next([9, 1, 2, 1, 2, 1, 2, 9])
      9
  """
  defp sum_of_digits_matching_next(list) do
    list_with_head = (list ++ [hd(list)])

    list_with_head
    |> Enum.zip(tl(list_with_head))
    |> Enum.reduce(0, fn {x, y}, acc ->
         if x == y do
           x + acc
         else
           acc
         end
       end)
  end
end

defmodule InverseCaptcha.CLI do
  def main(args) do
    string = hd(args)
    IO.puts InverseCaptcha.solve_captcha(string)
  end
end
