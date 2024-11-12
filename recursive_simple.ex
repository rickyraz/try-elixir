defmodule BelajarLanjut do
  # Contoh 1: Mengubah setiap angka dalam list menjadi dobel nilainya
  # Base case: list kosong return list kosong
  def dobel_angka([]), do: []

  def dobel_angka([head | tail]) do
    [head * 2 | dobel_angka(tail)]
  end

  # Cara pakai:
  # BelajarLanjut.dobel_angka([1, 2, 3])
  # Hasil: [2, 4, 6]

  # Contoh 2: Menjumlahkan list dengan accumulator
  def jumlah_list(list), do: do_jumlah(list, 0)

  # Private function dengan defp
  # Base case dengan accumulator
  defp do_jumlah([], total), do: total

  defp do_jumlah([head | tail], total) do
    do_jumlah(tail, total + head)
  end

  # Cara pakai:
  # BelajarLanjut.jumlah_list([1, 2, 3])
  # Hasil: 6
end
