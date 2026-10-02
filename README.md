# Template Sarjana dan Magister Informatika UII

Project ini adalah template LaTeX/Overleaf untuk dua jenjang dalam satu repository:

- **Sarjana (S1):** laporan Tugas Akhir Program Studi Informatika Program Sarjana;
- **Magister (S2):** Tesis Program Studi Informatika Program Magister.

Format Sarjana mengacu pada `Template-skripsi-final-versi2020.docx`. Format Magister mengacu pada `Rev3 - Template-Laporan-Tesis-MI-topic-base.docx`.

Pengguna tidak perlu melakukan comment/uncomment banyak halaman. Pilihan jenjang, identitas, judul, pembimbing, penguji, tahun, dan kata kunci diatur dari satu file, yaitu `config.tex`.

---

## 1. Mulai Cepat

### 1.1 Menggunakan Overleaf

1. Kompres seluruh source project menjadi ZIP. Jangan menyertakan folder `.git` atau file hasil kompilasi.
2. Di Overleaf, pilih **New Project → Upload Project**.
3. Unggah ZIP tersebut.
4. Pastikan **Main document** adalah `main.tex`.
5. Gunakan compiler **pdfLaTeX**.
6. Buka `config.tex` dan pilih jenjang.
7. Isi seluruh identitas pada `config.tex`.
8. Klik **Recompile**.

### 1.2 Memilih Jenjang

Nilai default adalah Sarjana:

```latex
\def\jenjang{sarjana}
```

Untuk menghasilkan Tesis Magister, ubah menjadi:

```latex
\def\jenjang{magister}
```

Gunakan hanya nilai `sarjana` atau `magister`. Nilai lain akan menghasilkan error saat kompilasi.

---

## 2. Mengisi `config.tex`

Seluruh data yang digunakan berulang kali didefinisikan pada `config.tex`. Ubah data di file tersebut saja; jangan mengetik ulang nama atau judul langsung pada halaman cover dan pengesahan.

### 2.1 Judul Indonesia

```latex
\newcommand{\judulTA}{JUDUL UTAMA}
\newcommand{\subjudulTA}{SUBJUDUL JIKA ADA}
```

Jika tidak menggunakan subjudul, kosongkan nilainya:

```latex
\newcommand{\subjudulTA}{}
```

Tanda titik dua antara judul dan subjudul dibuat otomatis.

### 2.2 Judul Inggris

Judul Inggris digunakan pada halaman `Abstract` Magister.

```latex
\newcommand{\judulInggris}{ENGLISH THESIS TITLE}
\newcommand{\subjudulInggris}{ENGLISH SUBTITLE IF APPLICABLE}
```

Jika tidak ada subjudul Inggris:

```latex
\newcommand{\subjudulInggris}{}
```

### 2.3 Data Mahasiswa

```latex
\newcommand{\namaMahasiswa}{NAMA LENGKAP MAHASISWA}
\newcommand{\nimMahasiswa}{20523000}
```

Untuk Magister, isi konsentrasi:

```latex
\newcommand{\konsentrasiMagister}{NAMA KONSENTRASI}
```

Variabel konsentrasi tidak ditampilkan pada mode Sarjana.

### 2.4 Data Pembimbing

```latex
\newcommand{\namaPembimbing}{Nama Pembimbing Pertama, Gelar}
\newcommand{\nipPembimbing}{NIK/NIP Pembimbing Pertama}
```

Pembimbing kedua bersifat opsional pada Magister. Jika hanya ada satu pembimbing:

```latex
\newcommand{\namaPembimbingDua}{}
\newcommand{\nipPembimbingDua}{}
```

Jika ada dua pembimbing:

```latex
\newcommand{\namaPembimbingDua}{Nama Pembimbing Kedua, Gelar}
\newcommand{\nipPembimbingDua}{NIK/NIP Pembimbing Kedua}
```

Halaman pengesahan Magister akan otomatis berubah dari satu pembimbing di tengah menjadi dua kolom Pembimbing I dan Pembimbing II.

### 2.5 Data Penguji

```latex
\newcommand{\namaPengujiSatu}{Nama Penguji Pertama, Gelar}
\newcommand{\nipPengujiSatu}{NIK/NIP Penguji Pertama}
\newcommand{\namaPengujiDua}{Nama Penguji Kedua, Gelar}
\newcommand{\nipPengujiDua}{NIK/NIP Penguji Kedua}
\newcommand{\namaPengujiTiga}{Nama Penguji Ketiga, Gelar}
\newcommand{\nipPengujiTiga}{NIK/NIP Penguji Ketiga}
```

Peran penguji ditentukan oleh template:

- Sarjana: penguji pertama tanpa label, penguji kedua `Anggota 1`, penguji ketiga `Anggota 2`;
- Magister: penguji pertama `Ketua`, penguji kedua `Anggota I`, penguji ketiga `Anggota II`.

### 2.6 Ketua Program Studi dan Tanggal

```latex
\newcommand{\ketuaProgramStudi}{Nama Ketua Program Studi, Gelar}
\newcommand{\nipKetuaProgramStudi}{NIK/NIP Ketua Program Studi}
\newcommand{\tanggalPengesahan}{Tanggal Bulan Tahun}
\newcommand{\bulanLulus}{Bulan}
\newcommand{\tahunLulus}{2026}
\newcommand{\kotaTerbit}{Yogyakarta}
```

### 2.7 Kata Kunci

```latex
\newcommand{\kataKunci}{kata kunci pertama, kata kunci kedua, kata kunci ketiga}
\newcommand{\keywords}{keyword one, keyword two, keyword three}
```

`\kataKunci` digunakan pada Sari/Abstrak Indonesia. `\keywords` digunakan pada Abstract Inggris.

### 2.8 Variabel Otomatis

Berdasarkan nilai `\jenjang`, template membuat variabel berikut secara otomatis:

| Variabel | Sarjana | Magister |
|---|---|---|
| `\jenisDokumen` | Tugas Akhir | Tesis |
| `\jenisDokumenKapital` | TUGAS AKHIR | TESIS |
| `\namaProgram` | PROGRAM SARJANA | PROGRAM MAGISTER |
| `\gelarTarget` | Sarjana Komputer | Magister Komputer |
| `\singkatanGelar` | S.Kom. | M.Kom. |

Jangan mendefinisikan ulang variabel otomatis tersebut di file lain.

---

## 3. Struktur Project

```text
UII-Informatics-Thesis-Template/
├── main.tex
├── config.tex
├── structure.tex
├── build.ps1
├── latexmkrc
├── README.md
├── Bibliographies/
│   └── references.bib
├── Images/
│   └── chapter2/
│       └── apple.jpg
├── Infos/
│   └── frontmatter/
│       ├── shared/
│       ├── sarjana/
│       └── magister/
├── chapters/
│   ├── chapter1.tex
│   ├── chapter2.tex
│   ├── chapter3.tex
│   ├── chapter4.tex
│   ├── chapter5.tex
│   ├── chapter6.tex
│   └── appendix.tex
└── elements/
    ├── figures/
    ├── tables/
    └── algorithms/
```

### File yang biasanya diedit mahasiswa

- `config.tex`: jenjang dan seluruh identitas;
- `chapters/*.tex`: narasi bab;
- `elements/figures/*.tex`: objek gambar;
- `elements/tables/*.tex`: objek tabel;
- `elements/algorithms/*.tex`: algoritma atau kode;
- contoh bawaan: `elements/figures/contoh-gambar.tex`, `elements/tables/contoh-data.tex`, `elements/tables/hasil-pengujian.tex`, dan `elements/algorithms/contoh-kode-rata-rata.tex`;
- `Images/`: file PNG/JPG/PDF yang digunakan;
- `Bibliographies/references.bib`: sumber referensi;
- file front matter tertentu bila isi contoh perlu diganti.

### File yang sebaiknya tidak diubah

- `structure.tex`, kecuali benar-benar mengubah aturan format global;
- `latexmkrc`;
- urutan conditional pada `main.tex`, kecuali struktur resmi berubah.

---

## 4. Front Matter

`main.tex` memilih front matter secara otomatis berdasarkan `\jenjang`.

### 4.1 Halaman Shared

Folder `Infos/frontmatter/shared/` berisi halaman yang dipakai kedua jenjang:

- `kata-pengantar.tex`;
- `daftar-isi.tex`;
- `daftar-tabel.tex`;
- `daftar-gambar.tex`;
- `glosarium.tex`.

### 4.2 Halaman Sarjana

Folder `Infos/frontmatter/sarjana/` berisi:

1. `01-cover.tex` — Cover;
2. `02-pengesahan-pembimbing.tex` — Pengesahan Pembimbing;
3. `03-pengesahan-penguji.tex` — Pengesahan Penguji;
4. `04-pernyataan-keaslian.tex` — Pernyataan Keaslian;
5. `05-persembahan.tex` — Persembahan;
6. `06-moto.tex` — Moto;
7. `07-sari.tex` — Sari.

### 4.3 Halaman Magister

Folder `Infos/frontmatter/magister/` berisi:

1. `01-cover.tex` — Cover;
2. `02-pengesahan-pembimbing.tex` — Lembar Pengesahan Pembimbing;
3. `03-pengesahan-penguji.tex` — Lembar Pengesahan Penguji;
4. `04-abstrak.tex` — Abstrak;
5. `05-abstract.tex` — Abstract;
6. `06-pernyataan-keaslian.tex` — Pernyataan Keaslian Tulisan;
7. `07-daftar-publikasi.tex` — Daftar Publikasi;
8. `08-halaman-kontribusi.tex` — Halaman Kontribusi;
9. `09-persembahan.tex` — Halaman Persembahan.

### 4.4 Mengubah Isi Front Matter

Ganti hanya teks placeholder atau isi narasi. Pertahankan perintah seperti:

```latex
\bagianawal{Kata Pengantar}
```

atau:

```latex
\bagianawaltanpatoc{HALAMAN PENGESAHAN DOSEN PEMBIMBING}
```

`\bagianawal` memasukkan judul ke Daftar Isi. `\bagianawaltanpatoc` membuat halaman tanpa memasukkannya ke Daftar Isi.

### 4.5 Penomoran Halaman

Template mengatur otomatis:

- cover tanpa nomor yang terlihat;
- front matter dengan angka Romawi kecil;
- isi utama dimulai kembali dari angka Arab 1;
- lampiran tanpa nomor yang terlihat sesuai template Sarjana saat ini;
- Sarjana menempatkan nomor di kanan atas;
- Magister menempatkan nomor di tengah bawah.

Posisi header/footer telah dikalibrasi terhadap jarak 1,27 cm pada template Word. Nilai internal `headsep` dan `footskip` LaTeX tidak sama langsung dengan 12,7 mm karena titik acu pengukurannya berbeda.

---

## 5. Menulis Bab dan Subbab

Setiap bab disimpan dalam file terpisah:

```text
chapters/chapter1.tex
chapters/chapter2.tex
...
```

Contoh struktur:

```latex
\chapter{PENDAHULUAN}

Paragraf pembuka bab.

\section{Latar Belakang}

Isi latar belakang.

\subsection{Anak Subbab}

Isi anak subbab.

\subsubsection*{Cucu Subbab}

Isi cucu subbab.
```

Aturan hierarki:

- `\chapter`: BAB;
- `\section`: subbab, misalnya 1.1;
- `\subsection`: anak subbab, misalnya 1.1.1, masuk Daftar Isi;
- `\subsubsection*`: cucu subbab tanpa nomor dan tidak masuk Daftar Isi.

Jangan mengetik nomor bab atau subbab secara manual. LaTeX akan membuat nomor berdasarkan urutan.

### Menambah Bab Baru

1. Buat file, misalnya `chapters/chapter7.tex`.
2. Isi file dengan `\chapter{JUDUL BAB}`.
3. Tambahkan ke `main.tex` setelah chapter sebelumnya:

```latex
\input{chapters/chapter7}
```

---

## 6. Menulis Paragraf

Format paragraf global sudah diatur:

- font Times-compatible 12 pt;
- spasi 1,5;
- rata kanan-kiri;
- indentasi baris pertama 1 cm;
- tanpa jarak tambahan antarparagraf.

Pisahkan paragraf dengan satu baris kosong:

```latex
Ini paragraf pertama. Tulis beberapa kalimat agar paragraf memiliki satu gagasan yang utuh.

Ini paragraf kedua. Jangan menggunakan `\\` untuk memisahkan paragraf biasa.
```

Gunakan `\\` hanya untuk kebutuhan baris khusus, tabel, atau layout yang memang mengharuskannya.

### Karakter Khusus LaTeX

Beberapa karakter harus ditulis dengan escape:

| Karakter | Penulisan |
|---|---|
| `%` | `\%` |
| `&` | `\&` |
| `_` | `\_` |
| `#` | `\#` |
| `$` | `\$` |

---

## 7. Gambar

Setiap objek gambar harus disimpan sebagai file `.tex` tersendiri pada `elements/figures/`. File chapter hanya memanggil objek dengan `\input`.

### 7.1 Menambahkan File Gambar

1. Simpan gambar ke folder `Images/`. Sebaiknya buat folder per bab:

```text
Images/chapter2/arsitektur-sistem.png
```

2. Gunakan nama file tanpa spasi jika memungkinkan.
3. Format yang disarankan: PNG untuk diagram/tangkapan layar, JPG untuk foto, PDF untuk gambar vektor.

### 7.2 Membuat File Objek Gambar

Buat:

```text
elements/figures/arsitektur-sistem.tex
```

Isi:

```latex
\begin{figure}[H]
  \centering
  \includegraphics[width=0.80\textwidth]{chapter2/arsitektur-sistem.png}
  \caption{Arsitektur sistem yang dikembangkan}
  \label{fig:arsitektur-sistem}
\end{figure}
\begin{center}
  \fontsize{12}{18}\selectfont Sumber: Dokumentasi penulis
\end{center}
```

### 7.3 Memanggil Gambar dari Chapter

Narasi harus memperkenalkan gambar sebelum objek ditampilkan:

```latex
Arsitektur sistem yang dikembangkan ditunjukkan pada Gambar~\ref{fig:arsitektur-sistem}.

\input{elements/figures/arsitektur-sistem}
```

Gunakan `~` sebelum `\ref` agar kata “Gambar” dan nomornya tidak terpisah baris.

### 7.4 Mengatur Ukuran Gambar

```latex
\includegraphics[width=0.50\textwidth]{...}
\includegraphics[width=0.80\textwidth]{...}
\includegraphics[width=\textwidth]{...}
```

Jangan memakai ukuran yang membuat teks pada gambar tidak terbaca. Jangan memperbesar gambar raster beresolusi rendah secara berlebihan.

### 7.5 Caption dan Label

- Caption gambar ditempatkan di bawah gambar.
- Letakkan `\label` setelah `\caption`.
- Gunakan label unik dengan awalan `fig:`.
- Jangan menulis nomor gambar manual.

Contoh label:

```latex
\label{fig:diagram-aktivitas-login}
```

### 7.6 Sumber Gambar

Jika gambar dibuat sendiri:

```text
Sumber: Dokumentasi penulis
```

Jika dari sumber lain, cantumkan sumber dan tambahkan referensinya ke BibTeX bila diperlukan.

### 7.7 Opsi Penempatan Float

Contoh template memakai `[H]`, yang berarti objek ditempatkan tepat pada lokasi pemanggilan:

```latex
\begin{figure}[H]
```

Jika LaTeX menghasilkan ruang kosong yang terlalu besar, gunakan penempatan yang lebih fleksibel:

```latex
\begin{figure}[htbp]
```

Arti huruf tersebut adalah `h` (di sekitar lokasi penulisan), `t` (bagian atas halaman), `b` (bagian bawah halaman), dan `p` (halaman khusus float). Jangan memaksa `[H]` untuk semua objek jika hasil pagination menjadi buruk.

---

## 8. Tabel

Setiap tabel disimpan pada file `.tex` tersendiri di `elements/tables/`.

### 8.1 Tabel Sederhana dengan `booktabs`

Buat:

```text
elements/tables/ringkasan-pengujian.tex
```

Isi:

```latex
\begin{table}[H]
  \centering
  \caption{Ringkasan hasil pengujian}
  \label{tab:ringkasan-pengujian}
  \begin{tabular}{lcc}
    \toprule
    \textbf{Skenario} & \textbf{Jumlah Data} & \textbf{Hasil (\%)} \\
    \midrule
    Skenario A & 100 & 91,00 \\
    Skenario B & 120 & 93,50 \\
    Skenario C & 80  & 89,75 \\
    \bottomrule
  \end{tabular}
\end{table}
```

Panggil dari chapter:

```latex
Hasil pengujian dirangkum pada Tabel~\ref{tab:ringkasan-pengujian}.

\input{elements/tables/ringkasan-pengujian}
```

Caption tabel berada di atas tabel.

### 8.2 Arti Spesifikasi Kolom

```latex
\begin{tabular}{lcc}
```

- `l`: rata kiri;
- `c`: rata tengah;
- `r`: rata kanan;
- `p{4cm}`: kolom selebar 4 cm dengan teks dapat membungkus.

### 8.3 Tabel Selebar Halaman dengan `tabularx`

Gunakan `tabularx` untuk kolom teks panjang:

```latex
\begin{table}[H]
  \centering
  \caption{Hasil pengujian fungsional}
  \label{tab:hasil-fungsional}
  \begin{tabularx}{\textwidth}{YCC}
    \toprule
    \textbf{Skenario} & \textbf{Hasil yang Diharapkan} & \textbf{Status} \\
    \midrule
    Pengguna memasukkan data valid & Data tersimpan & Berhasil \\
    Pengguna memasukkan data kosong & Pesan validasi muncul & Berhasil \\
    \bottomrule
  \end{tabularx}
\end{table}
```

Tipe kolom `Y` telah didefinisikan oleh template sebagai kolom fleksibel rata kiri. Tipe `C` adalah kolom fleksibel rata tengah.

### 8.4 Tabel Panjang Lebih dari Satu Halaman

Untuk tabel yang harus terpotong ke halaman berikutnya, gunakan `longtable`. Jangan membungkus `longtable` di dalam environment `table`.

```latex
\begin{longtable}{p{1cm}p{5cm}p{8cm}}
  \caption{Daftar kebutuhan sistem}\label{tab:kebutuhan-sistem} \\
  \toprule
  \textbf{No.} & \textbf{Kebutuhan} & \textbf{Deskripsi} \\
  \midrule
  \endfirsthead

  \multicolumn{3}{c}{\tablename\ \thetable\ -- lanjutan} \\
  \toprule
  \textbf{No.} & \textbf{Kebutuhan} & \textbf{Deskripsi} \\

  \midrule
  \endhead

  1 & Login & Sistem memvalidasi identitas pengguna. \\
  2 & Laporan & Sistem menghasilkan laporan. \\
  \bottomrule
\end{longtable}
```

### 8.5 Aturan Tabel

- Perkenalkan tabel dalam narasi sebelum tabel muncul.
- Caption berada di atas.
- Gunakan label unik dengan awalan `tab:`.
- Jangan menulis nomor tabel manual.
- Gunakan `\%` untuk persen dan `\&` untuk ampersand di dalam sel.
- Hindari tabel terlalu lebar; pecah kolom atau gunakan `tabularx`.

---

## 9. Persamaan dan Rumus

Persamaan dapat ditulis langsung pada file chapter karena merupakan bagian alur narasi. Nomor persamaan mengikuti nomor bab secara otomatis.

### 9.1 Persamaan Tunggal

```latex
\begin{equation}
  \bar{x} = \frac{1}{n}\sum_{i=1}^{n}x_i
  \label{eq:rata-rata}
\end{equation}
```

Acu dalam teks:

```latex
Nilai rata-rata dihitung menggunakan Persamaan~\eqref{eq:rata-rata}.
```

### 9.2 Menjelaskan Variabel

Setelah persamaan, jelaskan seluruh simbol:

```latex
Pada Persamaan~\eqref{eq:rata-rata}, $\bar{x}$ adalah nilai rata-rata,
$x_i$ adalah nilai pengamatan ke-$i$, dan $n$ adalah jumlah pengamatan.
```

Gunakan `$...$` untuk rumus pendek di dalam paragraf.

### 9.3 Beberapa Baris Persamaan

Gunakan `align` untuk beberapa persamaan yang disejajarkan:

```latex
\begin{align}
  precision &= \frac{TP}{TP + FP}, \label{eq:precision} \\
  recall    &= \frac{TP}{TP + FN}. \label{eq:recall}
\end{align}
```

Acu dengan:

```latex
Persamaan~\eqref{eq:precision} dan Persamaan~\eqref{eq:recall}
```

### 9.4 Persamaan Tanpa Nomor

```latex
\[
  y = ax + b
\]
```

Gunakan bentuk tanpa nomor hanya jika persamaan tidak akan dirujuk.

---

## 10. Algoritma dan Kode Program

Setiap algoritma atau kode disimpan sebagai file tersendiri di `elements/algorithms/`. Template menggunakan paket `listings`, font monospaced 9 pt, dan spasi tunggal.

### 10.1 Membuat File Kode

Buat:

```text
elements/algorithms/hitung-rata-rata.tex
```

Isi:

```latex
\begin{figure}[H]
\begin{minipage}{\textwidth}
\begin{lstlisting}[language=Python]
def hitung_rata_rata(data):
    if not data:
        return 0
    return sum(data) / len(data)
\end{lstlisting}
\end{minipage}
\caption{Kode program untuk menghitung nilai rata-rata}
\label{fig:kode-rata-rata}
\end{figure}
```

Panggil dari chapter:

```latex
Implementasi fungsi rata-rata ditunjukkan pada Gambar~\ref{fig:kode-rata-rata}.

\input{elements/algorithms/hitung-rata-rata}
```

Pada template ini kode diperlakukan sebagai gambar sehingga caption dan nomornya masuk dalam penomoran gambar.

### 10.2 Memilih Bahasa Pemrograman

```latex
\begin{lstlisting}[language=Python]
```

Contoh nilai `language` yang umum:

```text
Python
Java
C
C++
SQL
```

Jika bahasa tidak tersedia pada `listings`, hapus opsi `language=...` agar kode tetap dapat ditampilkan sebagai teks monospaced.

### 10.3 Menulis Pseudocode

Pseudocode dapat menggunakan `lstlisting` tanpa opsi bahasa:

```latex
\begin{figure}[H]
\begin{minipage}{\textwidth}
\begin{lstlisting}
ALGORITMA HitungRataRata(data)
  jika data kosong maka
    kembalikan 0
  akhir jika
  kembalikan jumlah(data) / banyak(data)
AKHIR ALGORITMA
\end{lstlisting}
\end{minipage}
\caption{Pseudocode perhitungan nilai rata-rata}
\label{fig:pseudocode-rata-rata}
\end{figure}
```

Simpan contoh tersebut pada file di `elements/algorithms/`, lalu panggil dengan `\input` dari chapter.

### 10.4 Kode Panjang

- Tampilkan hanya potongan penting di isi utama.
- Letakkan kode lengkap pada lampiran.
- Pastikan kode dijelaskan sebelum ditampilkan.
- Hindari tangkapan layar kode; gunakan `lstlisting` agar teks tetap tajam dan dapat disalin.

---

## 11. Daftar dan Pemerian

### Daftar berhuruf

```latex
\begin{enumerate}
  \item Item pertama.
  \item Item kedua.
  \item Item ketiga.
\end{enumerate}
```

Level pertama otomatis menggunakan huruf kecil. Level kedua otomatis menggunakan angka di dalam tanda kurung.

### Daftar tanpa nomor

```latex
\begin{itemize}
  \item Item pertama.
  \item Item kedua.
\end{itemize}
```

Gunakan daftar hanya jika isinya memang berupa pemerian. Jangan mengganti paragraf naratif dengan daftar tanpa alasan.

---

## 12. Label dan Cross-reference

Gunakan label unik dan konsisten:

| Objek | Awalan |
|---|---|
| Chapter | `ch:` |
| Section | `sec:` |
| Gambar | `fig:` |
| Tabel | `tab:` |
| Persamaan | `eq:` |

Contoh:

```latex
\chapter{METODOLOGI PENELITIAN}
\label{ch:metodologi}

\section{Pengumpulan Data}
\label{sec:pengumpulan-data}
```

Pemanggilan:

```latex
BAB~\ref{ch:metodologi}
Subbab~\ref{sec:pengumpulan-data}
Gambar~\ref{fig:arsitektur-sistem}
Tabel~\ref{tab:hasil-fungsional}
Persamaan~\eqref{eq:precision}
```

Jangan menulis nomor secara manual karena nomor dapat berubah ketika objek dipindahkan.

---

## 13. Referensi dan Daftar Pustaka

Database referensi berada di:

```text
Bibliographies/references.bib
```

### 13.1 Menambah Buku

```bibtex
@book{sommerville2016,
  author    = {Ian Sommerville},
  title     = {Software Engineering},
  edition   = {10},
  year      = {2016},
  publisher = {Pearson}
}
```

### 13.2 Menambah Artikel Jurnal

```bibtex
@article{contoh2026,
  author  = {Nama Penulis and Nama Penulis Kedua},
  title   = {Judul Artikel},
  journal = {Nama Jurnal},
  year    = {2026},
  volume  = {10},
  number  = {2},
  pages   = {100--115}
}
```

### 13.3 Sitasi dalam Teks

```latex
\cite{lamport1994}
```

Beberapa sumber sekaligus:

```latex
\cite{lamport1994,knuth1984}
```

Setelah menambah referensi, jalankan rangkaian pdfLaTeX–BibTeX–pdfLaTeX–pdfLaTeX agar sitasi dan Daftar Pustaka diperbarui.

Gaya Daftar Pustaka adalah APA edisi ke-6 melalui `apacite`.

---

## 14. Lampiran

Lampiran berada pada:

```text
chapters/appendix.tex
```

Contoh judul:

```latex
\chapter*{LAMPIRAN A}
\addcontentsline{toc}{chapter}{LAMPIRAN A}
```

Subbagian lampiran dapat ditulis tanpa dimasukkan ke Daftar Isi:

```latex
\section*{A.1 Data Tambahan}
```

Lampiran dapat berisi:

- instrumen penelitian;
- data tambahan;
- dokumentasi pengujian;
- kode program lengkap;
- dokumen pendukung.

Semua lampiran yang relevan harus disebutkan dalam isi utama.

---

## 15. Kompilasi

### 15.1 Overleaf

Overleaf menggunakan `latexmkrc` dan compiler pdfLaTeX. Setelah mengubah file, klik **Recompile**.

Jika referensi belum muncul, gunakan **Recompile from scratch** dari menu kompilasi Overleaf.

### 15.2 Windows dengan `build.ps1`

Jalankan dari PowerShell pada folder project:

```powershell
.\build.ps1
```

Skrip menjalankan:

1. pdfLaTeX;
2. BibTeX;
3. pdfLaTeX;
4. pdfLaTeX.

Output akhir adalah:

```text
main.pdf
```

Membersihkan file auxiliary dan temporary tanpa menghapus source:

```powershell
.\build.ps1 -Clean
```

### 15.3 Kompilasi Manual

```text
pdflatex main.tex
bibtex main
pdflatex main.tex
pdflatex main.tex
```

### 15.4 Menggunakan `latexmk`

```text
latexmk -pdf main.tex
```

Membersihkan output:

```text
latexmk -C
```

---

## 16. File Hasil Kompilasi

File berikut dibuat otomatis dan tidak perlu diunggah atau dimasukkan ke commit:

```text
main.pdf
*.aux
*.bbl
*.blg
*.lof
*.lot
*.out
*.toc
*.log
*.synctex.gz
*.fdb_latexmk
*.fls
```

File-file tersebut sudah dicantumkan dalam `.gitignore`.

---

## 17. Troubleshooting

### Project gagal karena compiler

Pastikan compiler adalah pdfLaTeX, bukan XeLaTeX.

### Gambar tidak ditemukan

Periksa:

- nama file dan ekstensi;
- huruf besar/kecil nama file;
- lokasi file di `Images/`;
- path pada `\includegraphics`.

Overleaf menggunakan sistem file case-sensitive. `Diagram.png` berbeda dengan `diagram.png`.

### Sitasi tampil sebagai `[?]`

- Pastikan key BibTeX sama dengan key di `\cite`.
- Jalankan BibTeX atau Recompile from scratch.
- Periksa sintaks `references.bib`.

### Referensi tampil sebagai `??`

Kompilasi pdfLaTeX minimal dua kali setelah BibTeX.

### Tabel melewati margin

- Gunakan `tabularx`;
- gunakan kolom `p{...}`;
- pendekkan judul kolom;
- pecah tabel menjadi beberapa tabel;
- hindari mengecilkan font sampai sulit dibaca.

### Gambar terlalu besar

Kurangi nilai `width`:

```latex
\includegraphics[width=0.70\textwidth]{...}
```

### Daftar Isi belum berubah

Kompilasi kembali minimal dua kali atau gunakan Recompile from scratch.

### Perubahan jenjang belum terlihat

Pastikan perubahan dilakukan pada baris berikut di `config.tex`:

```latex
\def\jenjang{sarjana}
```

atau:

```latex
\def\jenjang{magister}
```

Kemudian lakukan Recompile from scratch agar file `.toc`, `.lof`, dan `.lot` dari jenjang sebelumnya tidak digunakan kembali.

---

## 18. Checklist Sebelum Penyerahan

- [ ] Jenjang pada `config.tex` sudah benar.
- [ ] Judul dan subjudul sudah benar.
- [ ] Nama, NIM, pembimbing, penguji, dan Ketua Program Studi sudah benar.
- [ ] Tanggal pengesahan sudah benar.
- [ ] Seluruh kotak `PETUNJUK TEMPLATE` sudah dihapus dari naskah final.
- [ ] Tidak ada teks placeholder yang tertinggal.
- [ ] Semua gambar dan tabel telah disebutkan dalam narasi.
- [ ] Semua gambar dan tabel memiliki caption dan label unik.
- [ ] Semua persamaan bernomor telah dijelaskan dan dirujuk.
- [ ] Semua sitasi muncul dalam Daftar Pustaka.
- [ ] Tidak ada sitasi `[?]` atau referensi `??`.
- [ ] Daftar Isi, Daftar Tabel, dan Daftar Gambar sudah diperbarui.
- [ ] Lampiran telah disebutkan dalam isi utama.
- [ ] PDF telah diperiksa halaman demi halaman.
- [ ] Tidak ada halaman kosong yang tidak disengaja.
- [ ] File auxiliary tidak dimasukkan ke ZIP sumber.

---

## 19. Konvensi Nama File yang Disarankan

Gunakan huruf kecil dan tanda hubung:

```text
arsitektur-sistem.tex
hasil-pengujian.tex
diagram-alur.png
kode-klasifikasi.tex
```

Hindari:

- spasi pada nama file;
- nama seperti `gambar1-final-baru-revisi.png`;
- penggunaan huruf besar/kecil yang tidak konsisten;
- beberapa objek berbeda menggunakan label yang sama.

Dengan struktur ini, narasi bab tetap ringkas, objek mudah dipindahkan, dan perubahan pada satu gambar/tabel/kode tidak membuat file chapter sulit dibaca.
