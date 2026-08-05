
@echo off
setlocal

set /p INICIO=Primer sorteo:
set /p FIN=Ultimo sorteo:

mkdir Kino_JSON 2>nul

for /L %%i in (%INICIO%,1,%FIN%) do (
    curl -L "https://kinohistorico.cl/kino-api/draws/%%i" -o "Kino_JSON\%%i.json"
)

powershell Compress-Archive -Path Kino_JSON\* -DestinationPath Kino_%INICIO%_%FIN%.zip -Force

echo.
echo ==========================================
echo Descarga terminada.
echo Archivo creado:
echo Kino_%INICIO%_%FIN%.zip
echo ==========================================
pause
