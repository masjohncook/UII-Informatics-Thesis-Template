# Template Assessment: NYCU EECS → UII Jurusan Informatika

**Date:** 2026-03-29
**Source Template:** NYCU EECS Thesis/Dissertation Template
**Target:** UII (Universitas Islam Indonesia) Jurusan Informatika — S1/S2/S3

---

## Current Template Structure

```
MI Thesis Template/
├── main.tex                    # Master config — all metadata & document assembly
├── structure.tex               # Packages, margins, formatting definitions
├── NYCU_watermark.png          # University watermark
├── Buku Panduan Tesis.pdf      # Thesis format guideline (UII reference)
├── IEEEbib-abbrev.bst          # IEEE bibliography style (abbreviated)
├── ieee.bst                    # IEEE bibliography style
├── ieee_fullname.bst           # IEEE bibliography style (full names)
├── Infos/
│   ├── cover.tex               # Official cover/title pages (uses main.tex vars)
│   ├── covers.tex              # Alternative cover design
│   ├── acronyms.tex            # Acronym definitions
│   └── HOWTOnomenclature.txt   # Guide for nomenclature setup
├── Abstracts/
│   ├── abstracts.tex           # Abstract structure/orchestration
│   ├── abstractCH.tex          # Chinese abstract content
│   └── abstractEN.tex          # English abstract content
├── chapters/
│   ├── chapter1.tex            # Introduction (with extensive examples)
│   ├── chapter2.tex            # Related Works
│   ├── conclusion.tex          # Conclusion
│   ├── acknowledgments.tex     # Acknowledgments
│   ├── autobiography.tex       # Autobiography
│   └── appendix.tex            # Appendix content
├── Bibliographies/
│   └── egbib.bib               # Sample bibliography entries
├── Images/
│   ├── chapter1/portrait.jpeg
│   └── chapter2/apple.jpg
└── Gen_Toc2Text/               # Utility: converts .toc to readable text
```

---

## Key Configuration Variables (main.tex lines 26–49)

| Command | Purpose | Current Value |
|---|---|---|
| `\universityCH` | University name (Chinese) | 國立陽明交通大學 |
| `\universityEN` | University name (English) | National Yang Ming Chiao Tung University |
| `\departmentCH` | Department (Chinese) | 電機資訊國際學位學程 |
| `\departmentEN` | Department (English) | EECS International Graduate Program |
| `\degreeCH` | Degree type (Chinese) | 博士論文 / 碩士論文 |
| `\degreeEN` | Degree type (English) | Doctoral Dissertation / Master Thesis |
| `\titleCH` | Thesis title (Chinese) | — |
| `\titleEN` | Thesis title (English) | — |
| `\nameCH` | Student name (Chinese) | — |
| `\nameEN` | Student name (English) | — |
| `\AdvisorNameCH/EN` | Advisor name | — |
| `\CoAdvisorNameCH/EN` | Co-advisor name | — |
| `\SubmitTimeCH/EN` | Graduation date | 一一一年十二月 / December 2022 |
| `\SubmittedTo` | Submission destination | EECS International Graduate Program |
| `\DegreeType` | Formal degree type | Doctor of Philosophy |
| `\DegreeIn` | Major field | Electrical Engineering and Computer Science |

---

## What Must Change for UII Informatika

### Major Changes

#### 1. Language — Remove Chinese/CJK
- Remove all `\begin{CJK}{UTF8}{bkai}...\end{CJK}` blocks
- Remove `\CHon` / `\CHoff` commands
- Remove `CJK` package from `structure.tex`
- Template becomes **Indonesian** (or Indonesian + English bilingual)

#### 2. Cover Page (`Infos/cover.tex`)
Complete redesign for UII format:
- UII logo at top (replace `NYCU_watermark.png`)
- Indonesian cover layout:
  ```
  UNIVERSITAS ISLAM INDONESIA
  FAKULTAS TEKNOLOGI INDUSTRI
  PROGRAM STUDI INFORMATIKA
  [SKRIPSI / TESIS / DISERTASI]
  [Title]
  Disusun Oleh:
  [Name] / NIM: [NIM]
  Dosen Pembimbing: [Advisor]
  Yogyakarta, [Year]
  ```

#### 3. Degree-Level Switcher
Single variable in `main.tex` controls everything:

```latex
\newcommand{\degreeLevel}{S2}  % S1, S2, or S3
```

| Level | Document Type | Program | Gelar |
|---|---|---|---|
| S1 | Skripsi | Program Sarjana | S.Kom. |
| S2 | Tesis | Program Magister | M.Kom. |
| S3 | Disertasi | Program Doktor | Dr. |

#### 4. Metadata Commands — Add Indonesian Fields
New fields needed:
- `\nim` — Student ID number (Nomor Induk Mahasiswa)
- `\university` — Universitas Islam Indonesia
- `\faculty` — Fakultas Teknologi Industri
- `\department` — Program Studi Informatika
- `\degreeLevel` — S1 / S2 / S3
- `\submitYear` — Year of submission
- `\submitMonth` — Month of submission
- `\advisorName` — Dosen Pembimbing
- `\coAdvisorName` — Dosen Pembimbing II (optional)
- `\titleID` — Title in Indonesian
- `\titleEN` — Title in English (optional for S1, required for S2/S3)

Remove:
- `\universityCH`, `\departmentCH`, `\degreeCH`, `\nameCH`, etc. (all Chinese variants)
- `\SubmitTimeCH`

#### 5. Abstract Structure
- **S1**: Indonesian abstract only (or + English)
- **S2/S3**: Indonesian + English abstracts (bilingual)
- Remove `abstractCH.tex` → rename to `abstractID.tex`

#### 6. Location String
Change `Taiwan, Republic of China` → `Yogyakarta, Indonesia`

#### 7. Watermark
Replace `NYCU_watermark.png` with UII logo image.

#### 8. Institutional PDF Forms
Replace or remove:
- `Authorization Form.pdf` → UII equivalent (Lembar Pengesahan, Lembar Pernyataan)
- `Validation Form.pdf` → UII equivalent

#### 9. Citation Style
- IEEE style may be kept for Informatika
- Verify with `Buku Panduan Tesis.pdf` — may require APA or custom UII style

---

### Minor Changes

#### Chapter Structure (Indonesian standard thesis)
Typical UII/Indonesian thesis structure:

| Chapter | NYCU (English) | UII Informatika (Indonesian) |
|---|---|---|
| I | Introduction | Pendahuluan |
| II | Related Works | Tinjauan Pustaka |
| III | (content) | Metodologi Penelitian |
| IV | (content) | Hasil dan Pembahasan |
| V | Conclusion | Kesimpulan dan Saran |

#### Terminology
| NYCU Term | UII Term |
|---|---|
| Thesis / Dissertation | Skripsi / Tesis / Disertasi |
| Advisor | Dosen Pembimbing |
| Co-Advisor | Dosen Pembimbing II |
| Acknowledgments | Kata Pengantar |
| Abstract | Abstrak |
| Table of Contents | Daftar Isi |
| List of Figures | Daftar Gambar |
| List of Tables | Daftar Tabel |
| Bibliography | Daftar Pustaka |
| Autobiography | Biodata Penulis |
| Appendices | Lampiran |

---

## What Stays the Same

- `structure.tex` package infrastructure (margins, spacing, numbering)
- Figure/table/equation numbering by chapter
- `chapters/` content system — users still write in `.tex` files
- Bibliography system (`.bib` file + `.bst` style)
- All example content in `chapter1.tex`
- `Gen_Toc2Text/` utility
- Compilation workflow (PdfLaTeX → BibTeX → PdfLaTeX)

---

## Proposed Degree Switching Implementation

```latex
% main.tex — user sets ONE variable:
\newcommand{\degreeLevel}{S2}  % Options: S1, S2, S3

% Template auto-resolves these:
\ifthenelse{\equal{\degreeLevel}{S1}}{
  \newcommand{\documentType}{Skripsi}
  \newcommand{\programLevel}{Program Sarjana}
  \newcommand{\degreeTitle}{Sarjana Komputer}
  \newcommand{\degreeAbbr}{S.Kom.}
}{}
\ifthenelse{\equal{\degreeLevel}{S2}}{
  \newcommand{\documentType}{Tesis}
  \newcommand{\programLevel}{Program Magister}
  \newcommand{\degreeTitle}{Magister Komputer}
  \newcommand{\degreeAbbr}{M.Kom.}
}{}
\ifthenelse{\equal{\degreeLevel}{S3}}{
  \newcommand{\documentType}{Disertasi}
  \newcommand{\programLevel}{Program Doktor}
  \newcommand{\degreeTitle}{Doktor Ilmu Komputer}
  \newcommand{\degreeAbbr}{Dr.}
}{}
```

---

## Open Questions (to confirm before implementation)

1. **UII logo** — Do you have the official UII logo/watermark image file?
2. **Buku Panduan Tesis.pdf** — Is this the official UII formatting guide? (Currently unreadable without `poppler`. Install with: `brew install poppler`)
3. **Language** — Bilingual (Indonesian + English) or Indonesian only?
4. **Citation style** — IEEE, APA, or UII-specific?
5. **Working directory** — Modify in place, or create a new separate folder?
6. **Lembar Pengesahan** — Do you have the PDF forms for UII, or should the template generate them from LaTeX?

---

## Effort Estimate by File

| File | Change Type | Effort |
|---|---|---|
| `main.tex` | Rewrite metadata section, add degree switcher | Medium |
| `Infos/cover.tex` | Full redesign for UII format | High |
| `Abstracts/abstracts.tex` | Restructure for Indonesian/bilingual | Medium |
| `Abstracts/abstractCH.tex` | Rename → `abstractID.tex`, update content | Low |
| `structure.tex` | Remove CJK, minor terminology updates | Low |
| `chapters/acknowledgments.tex` | Update template text to Indonesian | Low |
| `chapters/chapter1–conclusion.tex` | Update section names (optional) | Low |
| `NYCU_watermark.png` | Replace with UII logo | Dependent on asset |
