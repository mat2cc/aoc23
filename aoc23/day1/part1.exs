defmodule Helpers do
  def only_nums("", acc), do: acc
  def only_nums(<<c::binary-size(1)>> <> rest, acc) do
    case Integer.parse(c) do
      :error -> only_nums(rest, acc)
      _ -> only_nums(rest, [c | acc])
    end
  end

  def get_nums(list) do
    # IO.puts(List.first(list))
    str = (Enum.reverse(list) |> List.first) <> List.first(list) 
    String.to_integer(String.trim(str))
  end
end

{:ok, binary} = File.read("input")

String.split(binary, "\n", trim: true)
|> Enum.map(fn line -> Helpers.only_nums(line, []) end)
|> Enum.map(fn nums -> Helpers.get_nums(nums) end)
|> Enum.sum()
|> IO.puts()

# |> Enum.map(fn a -> Helpers.get_nums(a) end)
