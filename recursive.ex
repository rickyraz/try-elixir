defmodule RecursiveTransform do
  # Contoh 1: Transformasi list secara immutable
  def transform_list([]), do: []

  def transform_list([head | tail]) do
    [head * 2 | transform_list(tail)]
  end

  # Contoh 2: Transformasi struktur pohon
  def transform_tree(nil), do: nil

  def transform_tree(%{value: value, left: left, right: right}) do
    %{
      value: value * 2,
      left: transform_tree(left),
      right: transform_tree(right)
    }
  end

  # Contoh 3: Pattern dengan accumulator
  def sum_list(list), do: do_sum_list(list, 0)

  defp do_sum_list([], acc), do: acc

  defp do_sum_list([head | tail], acc) do
    do_sum_list(tail, acc + head)
  end

  # Contoh 4: Update nested map secara immutable
  def update_nested(map, [], value), do: value

  def update_nested(map, [key | rest], value) do
    Map.put(map, key, update_nested(Map.get(map, key, %{}), rest, value))
  end

  # Contoh 5: Transformasi data dengan pattern matching
  def process_users([]), do: []

  def process_users([user | rest]) do
    processed_user = %{user | name: String.upcase(user.name), age: user.age + 1}
    [processed_user | process_users(rest)]
  end

  # Contoh 6: Recursive reduce dengan multiple accumulators
  def analyze_numbers(numbers) do
    # {sum, count, max}
    initial_acc = {0, 0, 0}
    do_analyze(numbers, initial_acc)
  end

  defp do_analyze([], {sum, count, max}), do: %{sum: sum, average: sum / count, max: max}

  defp do_analyze([num | rest], {sum, count, max}) do
    do_analyze(rest, {
      sum + num,
      count + 1,
      max(max, num)
    })
  end
end

# Contoh penggunaan dengan pipe operator
defmodule DataProcessor do
  def process_data(data) do
    data
    |> transform_data()
    |> validate_data()
    |> format_result()
  end

  defp transform_data([]), do: []

  defp transform_data([head | tail]) do
    [process_item(head) | transform_data(tail)]
  end

  defp process_item(item) do
    %{item | value: item.value * 2}
  end

  defp validate_data([]), do: []

  defp validate_data([head | tail]) when head.value > 0 do
    [head | validate_data(tail)]
  end

  defp validate_data([_ | tail]), do: validate_data(tail)

  defp format_result(items) do
    Enum.map(items, &Map.take(&1, [:id, :value]))
  end
end
