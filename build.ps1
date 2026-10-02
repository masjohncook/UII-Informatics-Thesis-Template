param(
    [switch]$Clean
)

$target = "main"

if ($Clean) {
    Write-Host "Membersihkan file auxiliary..." -ForegroundColor Yellow
    $extensions = @("*.aux", "*.bbl", "*.bcf", "*.blg", "*.fls", "*.fdb_latexmk", "*.lof", "*.log", "*.lot", "*.out", "*.synctex.gz", "*.toc")
    foreach ($ext in $extensions) {
        Remove-Item $ext -ErrorAction SilentlyContinue
    }
    Write-Host "Selesai dibersihkan." -ForegroundColor Green
    exit 0
}

Write-Host "==> Kompilasi tahap 1: pdflatex" -ForegroundColor Cyan
pdflatex -interaction=nonstopmode -enable-installer "$target.tex"
if ($LASTEXITCODE -ne 0) {
    Write-Host "Error pada tahap 1 pdflatex." -ForegroundColor Red
    exit $LASTEXITCODE
}

Write-Host "==> Kompilasi tahap 2: bibtex (daftar pustaka)" -ForegroundColor Cyan
bibtex $target
if ($LASTEXITCODE -ne 0) {
    Write-Host "Error pada tahap bibtex." -ForegroundColor Red
    exit $LASTEXITCODE
}

Write-Host "==> Kompilasi tahap 3: pdflatex (resolusi sitasi)" -ForegroundColor Cyan
pdflatex -interaction=nonstopmode -enable-installer "$target.tex"

Write-Host "==> Kompilasi tahap 4: pdflatex (resolusi cross-reference & daftar isi)" -ForegroundColor Cyan
pdflatex -interaction=nonstopmode -enable-installer "$target.tex"

if ($LASTEXITCODE -eq 0) {
    Write-Host "`nBerhasil! File $target.pdf telah dibuat." -ForegroundColor Green
} else {
    Write-Host "`nTerdapat peringatan atau error saat kompilasi. Cek file $target.log." -ForegroundColor Yellow
}
