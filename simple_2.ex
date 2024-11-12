defmodule TransformasiData do
  # Mengubah list string menjadi uppercase
  def uppercase_nama([]), do: []

  def uppercase_nama([nama | nama_lain]) do
    [String.upcase(nama) | uppercase_nama(nama_lain)]
  end

  # Cara pakai:
  # TransformasiData.uppercase_nama(["budi", "ani", "caca"])
  # Hasil: ["BUDI", "ANI", "CACA"]

  # Memfilter angka genap
  def filter_genap([]), do: []

  def filter_genap([head | tail]) when rem(head, 2) == 0 do
    [head | filter_genap(tail)]
  end

  def filter_genap([_head | tail]), do: filter_genap(tail)

  # Cara pakai:
  # TransformasiData.filter_genap([1, 2, 3, 4, 5, 6])
  # Hasil: [2, 4, 6]
end
