@echo off
chcp 65001 >nul
echo ===================================================
echo   CS KKU Project LaTeX Compiler (Docker)
echo ===================================================

if "%1"=="" goto build
if "%1"=="watch" goto watch
if "%1"=="clean" goto clean
if "%1"=="shell" goto shell

:build
echo [1/1] Compiling main.tex to PDF...
docker compose run --rm latex
goto end

:watch
echo Watching for file changes (Auto-recompile)...
docker compose run --rm watch
goto end

:clean
echo Cleaning auxiliary and temporary files...
docker compose run --rm clean
goto end

:shell
echo Opening interactive shell inside container...
docker compose run --rm latex bash
goto end

:end
echo Finished!
