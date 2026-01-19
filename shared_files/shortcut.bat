@echo off
REM copy project path from your device and paste here
REM ── your project folder ─────────────────────────────────────────
set "PROJDIR=C:\Users\mazen\Downloads\Networks_project (2)\Networks_project"
REM ────────────────────────────────────────────────────────────────


cd /d "%PROJDIR%"

REM 1. Run server.py in its own window
start "FileShare-SERVER" cmd /k python "%PROJDIR%\server.py"

timeout /t 3 > nul   REM (give the socket server a moment)

REM 2. Run app.py (Flask) in another window
start "FileShare-APP" cmd /k python "%PROJDIR%\app.py"

timeout /t 2 > nul   REM (wait for Flask to start)

REM 3. Open the web UI
start "" "http://127.0.0.1:5000/"

REM after modifying path save this as .batfile and use as normal shortcut.