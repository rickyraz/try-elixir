# 1. Basic Matching

# Match 1 ke variabel a
a = 1
# Pin operator - memastikan a tetap 1
^a = 1
# Valid! Karena nilainya cocok (match)
1 = a
# ERROR! Karena 2 tidak cocok dengan 1
2 = a

# 2. Pattern Matching dengan List
# x jadi 1, y jadi 2
[x, y] = [1, 2]
# head jadi 1, tail jadi [2,3]
[head | tail] = [1, 2, 3]

# Ini akan error:
# ERROR! Jumlah elemen tidak cocok
[a, b] = [1, 2, 3]

# 3. Multiple Matching
# Valid - a = 1
{a, a} = {1, 1}
# ERROR! Karena a tidak bisa match dengan dua nilai berbeda
{a, a} = {1, 2}

# 4. Pattern Matching dengan Map
# nama = "Budi"
%{nama: nama} = %{nama: "Budi", umur: 20}
# Valid! x = 1, y = 2
%{x: x, y: y} = %{x: 1, y: 2, z: 3}
# ERROR! Tidak ada key :z
%{x: x, z: z} = %{x: 1, y: 2}

# 5. Pin Operator (^)
x = 1
# Valid - y = 2
{^x, y} = {1, 2}
# ERROR! x sudah 1, tidak bisa match dengan 2
{^x, y} = {2, 2}

# ------------

# Step 1
# a terikat (bound) ke nilai 1
[a, a] = [1, 1]
# Di sini pattern matching memastikan kedua nilai sama

# Step 2
# a di-rebind ke nilai 4, c terikat ke 3
[a, c] = [4, 3]
# Ini adalah binding baru, bukan mutasi nilai 1

# Dengan pin operator
# a = 1
[a, a] = [1, 1]
# ERROR! Karena ^a memaksa nilai tetap 1
[^a, c] = [4, 3]

# Contoh lebih lengkap:
# Binding pertama
iex(1) > a = 1
1
# OK karena nilainya sama
iex(2) > ^a = 1
1
# ERROR! Karena a di-pin ke nilai 1
iex(3) > ^a = 2
# ** (MatchError) no match of right hand side value: 2
