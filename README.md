# Template Tugas Akhir S1 Informatika UII

Template LaTeX/Overleaf ini mengikuti struktur dan format `Template-skripsi-final-versi2020.docx`.

## Pengaturan Overleaf

1. Unggah ZIP project sehingga `main.tex` berada di direktori teratas.
2. Pastikan **Main document** adalah `main.tex`.
3. Compiler default **pdfLaTeX** dapat langsung digunakan.
4. Klik **Recompile**. File `latexmkrc` sudah mengatur pdfLaTeX dan BibTeX.

## Mengisi identitas

Semua identitas utama berada di bagian `DATA UTAMA` pada `main.tex`:

- judul tugas akhir;
- nama dan NIM;
- pembimbing dan penguji;
- ketua program studi;
- tanggal pengesahan;
- bulan dan tahun kelulusan;
- kata kunci.

Jangan mengubah `structure.tex` kecuali ingin mengubah aturan format global.

## Format yang diterapkan

- A4;
- margin 25,4 mm pada semua sisi;
- font Times-compatible 12 pt melalui `newtxtext` (padanan terbuka Times New Roman yang tersedia di Overleaf);
- spasi 1,5;
- paragraf rata kanan-kiri dengan indentasi baris pertama 1 cm;
- judul bab dan subbab 12 pt tebal;
- nomor bagian awal menggunakan Romawi kecil;
- BAB I dimulai kembali pada halaman Arab 1;
- nomor lampiran disembunyikan;
- referensi memakai gaya APA edisi ke-6 (`apacite`).

## Struktur isi

- `Infos/frontmatter.tex`: halaman awal sampai daftar gambar;
- `chapters/chapter1.tex` s.d. `chapter6.tex`: isi utama;
- `chapters/appendix.tex`: lampiran;
- `Bibliographies/references.bib`: database referensi;
- `Images/`: gambar per bab.

## Gambar

```latex
\begin{figure}[H]
  \centering
  \includegraphics[width=0.45\textwidth]{chapter2/apple.jpg}
  \caption{Judul gambar}
  \label{fig:contoh}
\end{figure}
```

Acu dalam teks dengan `Gambar~\ref{fig:contoh}`. Letakkan gambar di `Images/` dan selalu tuliskan sumber setelah caption bila gambar bukan karya sendiri.

## Tabel

```latex
\begin{table}[H]
  \centering
  \caption{Judul tabel}
  \label{tab:contoh}
  \begin{tabular}{ll}
    \toprule
    Kolom 1 & Kolom 2 \\
    \midrule
    Data A & Data B \\
    \bottomrule
  \end{tabular}
\end{table}
```

Caption tabel ditempatkan di atas. Acu dengan `Tabel~\ref{tab:contoh}`.

## Persamaan

```latex
\begin{equation}
  y = ax + b
  \label{eq:linear}
\end{equation}
```

Acu dengan `Persamaan~\eqref{eq:linear}`. Nomor mengikuti bab, misalnya `(3.1)`.

## Kode program

Gunakan `lstlisting`. Format global sudah mengatur font monospaced 9 pt dan spasi tunggal. Contoh lengkap tersedia di `chapters/chapter3.tex`.

## Referensi

Tambahkan entri BibTeX ke `Bibliographies/references.bib`:

```bibtex
@book{sommerville2016,
  author    = {Ian Sommerville},
  title     = {Software Engineering},
  year      = {2016},
  publisher = {Pearson}
}
```

Gunakan `\cite{...}` dalam naskah. Jangan mengetik daftar pustaka secara manual.

## Kompilasi lokal

```text
latexmk -pdf main.tex
```

Bersihkan output build dengan:

```text
latexmk -C
```

File PDF dan auxiliary tidak perlu dimasukkan ke ZIP sumber Overleaf.
