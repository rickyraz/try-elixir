defmodule Pengguna do
  # Mendefinisikan struct
  defstruct nama: "", umur: 0

  def update_umur(pengguna = %Pengguna{}, tambah_umur) do
    %Pengguna{pengguna | umur: pengguna.umur + tambah_umur}
  end

  # Mengupdate list dari struct Pengguna
  def tambah_umur_semua([], _tambah), do: []

  def tambah_umur_semua([pengguna | lainnya], tambah) do
    [update_umur(pengguna, tambah) | tambah_umur_semua(lainnya, tambah)]
  end

  # Cara pakai:
  # pengguna1 = %Pengguna{nama: "Budi", umur: 20}
  # pengguna2 = %Pengguna{nama: "Ani", umur: 25}
  # Pengguna.tambah_umur_semua([pengguna1, pengguna2], 1)
end
