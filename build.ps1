param (
    [string]$Action = "build"
)

Write-Host "===================================================" -ForegroundColor Cyan
Write-Host "  CS KKU Project LaTeX Compiler (Docker)" -ForegroundColor Cyan
Write-Host "===================================================" -ForegroundColor Cyan

switch ($Action.ToLower()) {
    "build" {
        Write-Host "Compiling main.tex to PDF..." -ForegroundColor Green
        docker compose run --rm latex
    }
    "watch" {
        Write-Host "Watching for changes (Auto-recompile)..." -ForegroundColor Yellow
        docker compose run --rm watch
    }
    "clean" {
        Write-Host "Cleaning auxiliary files..." -ForegroundColor Yellow
        docker compose run --rm clean
    }
    "shell" {
        Write-Host "Opening interactive shell..." -ForegroundColor Magenta
        docker compose run --rm latex bash
    }
    default {
        Write-Host "Usage: .\build.ps1 [build | watch | clean | shell]" -ForegroundColor Red
    }
}
