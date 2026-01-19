@echo off
REM ── where am I?  %~dp0 expands to the folder of this .bat ─────────────
set "PROJDIR=%~dp0"
cd /d "%PROJDIR%"
REM (now server.py, app.py and this .bat must sit in the same folder)

REM 1. start the socket server
start "FileShare-SERVER" cmd /k python server.py

timeout /t 3 > nul

REM 2. start the Flask app
start "FileShare-APP"    cmd /k python app.py

timeout /t 2 > nul

REM 3. open the browser
start "" "http://127.0.0.1:5000/"
