# Template Sarjana dan Magister Informatika UII

Satu project LaTeX/Overleaf ini dapat menghasilkan laporan Tugas Akhir Sarjana atau Tesis Magister. Format Sarjana mengacu pada `Template-skripsi-final-versi2020.docx`, sedangkan format Magister mengacu pada `Rev3 - Template-Laporan-Tesis-MI-topic-base.docx`.

## Memilih jenjang

Semua pengaturan berada di `config.tex`. Nilai default adalah Sarjana:

```latex
\def\jenjang{sarjana}
```

Untuk membuat Tesis Magister, ubah satu baris tersebut menjadi:

```latex
\def\jenjang{magister}
```

Nilai selain `sarjana` atau `magister` akan menghasilkan error yang jelas saat kompilasi. Tidak diperlukan comment/uncomment halaman secara manual.

## Mengisi metadata

Ubah seluruh identitas hanya di `config.tex`:

- judul dan subjudul Indonesia;
- judul dan subjudul Inggris;
- nama dan NIM mahasiswa;
- konsentrasi Magister;
- pembimbing pertama dan pembimbing kedua;
- tiga dosen penguji;
- Ketua Program Studi;
- tanggal pengesahan dan tahun;
- kata kunci Indonesia dan Inggris.

Variabel turunan berikut dibuat otomatis berdasarkan jenjang:

- `\jenisDokumen`: Tugas Akhir atau Tesis;
- `\namaProgram`: PROGRAM SARJANA atau PROGRAM MAGISTER;
- `\gelarTarget`: Sarjana Komputer atau Magister Komputer;
- format nomor bab, margin, judul front matter, dan posisi nomor halaman.

### Pembimbing kedua Magister

Kosongkan variabel berikut jika hanya terdapat satu pembimbing:

```latex
\newcommand{\namaPembimbingDua}{}
```

Jika ada dua pembimbing, isi nama dan NIK/NIP-nya. Halaman pengesahan Magister otomatis berubah menjadi dua kolom.

## Struktur front matter

`main.tex` memilih dan mengurutkan halaman secara otomatis.

```text
Infos/frontmatter/
├── shared/
│   ├── kata-pengantar.tex
│   ├── daftar-isi.tex
│   ├── daftar-tabel.tex
│   ├── daftar-gambar.tex
│   └── glosarium.tex
├── sarjana/
│   ├── 01-cover.tex
│   ├── 02-pengesahan-pembimbing.tex
│   ├── 03-pengesahan-penguji.tex
│   ├── 04-pernyataan-keaslian.tex
│   ├── 05-persembahan.tex
│   ├── 06-moto.tex
│   └── 07-sari.tex
└── magister/
    ├── 01-cover.tex
    ├── 02-pengesahan-pembimbing.tex
    ├── 03-pengesahan-penguji.tex
    ├── 04-abstrak.tex
    ├── 05-abstract.tex
    ├── 06-pernyataan-keaslian.tex
    ├── 07-daftar-publikasi.tex
    ├── 08-halaman-kontribusi.tex
    └── 09-persembahan.tex
```

### Urutan Magister

1. Lembar Pengesahan Pembimbing
2. Lembar Pengesahan Penguji
3. Abstrak
4. Abstract
5. Pernyataan Keaslian Tulisan
6. Daftar Publikasi
7. Halaman Kontribusi
8. Halaman Persembahan
9. Kata Pengantar
10. Daftar Isi
11. Daftar Tabel
12. Daftar Gambar
13. Glosarium

### Perbedaan format otomatis

- Sarjana: margin 25,4 mm semua sisi, nomor halaman di kanan atas, bab Romawi.
- Magister: margin kiri 30 mm dan sisi lain 25 mm, nomor halaman di tengah bawah, bab Arab.
- Cover, pengesahan, pernyataan, abstrak, serta halaman khusus dipilih otomatis.
- Isi chapter masih digunakan bersama untuk kedua jenjang pada tahap ini.

## Struktur isi dan objek

```text
chapters/                  narasi setiap bab
elements/figures/          satu file .tex untuk setiap gambar
elements/tables/           satu file .tex untuk setiap tabel
elements/algorithms/       satu file .tex untuk setiap algoritma atau kode
Images/                    file PNG/JPG
Bibliographies/            database BibTeX
```

Dari file chapter, panggil objek dengan `\input`:

```latex
\input{elements/figures/contoh-gambar}
\input{elements/tables/contoh-data}
\input{elements/algorithms/contoh-kode-rata-rata}
```

## Persamaan

Persamaan dapat ditulis di file chapter:

```latex
\begin{equation}
  y = ax + b
  \label{eq:linear}
\end{equation}
```

Acu dengan `Persamaan~\eqref{eq:linear}`.

## Referensi

Tambahkan sumber ke `Bibliographies/references.bib` dan gunakan:

```latex
\cite{kode-referensi}
```

Daftar pustaka memakai gaya APA edisi ke-6 melalui `apacite`.

## Pengaturan Overleaf

1. Pastikan Main document adalah `main.tex`.
2. Gunakan compiler default pdfLaTeX.
3. Klik Recompile setelah mengubah `config.tex`.

## Kompilasi lokal Windows

```powershell
.\build.ps1
```

Untuk membersihkan file hasil kompilasi:

```powershell
.\build.ps1 -Clean
```

Alternatif manual:

```text
pdflatex main.tex
bibtex main
pdflatex main.tex
pdflatex main.tex
```

Jangan masukkan file PDF dan auxiliary ke ZIP sumber Overleaf.
