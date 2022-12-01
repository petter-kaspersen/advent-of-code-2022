defmodule AdventOfCode.DayOne do
  @test_result 24000

  @input File.read!("day1/input.txt")

  def test do
    result =
      File.read!("day1/example.txt")
      |> solve
      |> List.first()

    case result do
      @test_result ->
        IO.puts("CORRECT")

      _ ->
        IO.puts("Expected #{@test_result} got #{result}")
    end
  end

  def solve(input) do
    input
    |> collect_elves()
    |> sum_elves()
    |> Enum.sort(:desc)
  end

  def sum_elves(elves) do
    Enum.map(elves, fn elf ->
      Enum.sum(elf)
    end)
  end

  def collect_elves(input) do
    input
    |> String.split("\n\n")
    |> Enum.map(fn str ->
      str
      |> String.split("\n")
      |> Enum.map(fn num ->
        String.to_integer(num)
      end)
    end)
  end

  def part_one() do
    @input
    |> solve()
    |> List.first()
    |> IO.inspect()
  end

  def part_two() do
    @input
    |> solve()
    |> Enum.take(3)
    |> Enum.sum()
    |> IO.inspect()
  end
end

AdventOfCode.DayOne.test()
AdventOfCode.DayOne.part_one()
AdventOfCode.DayOne.part_two()
