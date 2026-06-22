@echo off
echo Starting SDLC PM Server...
cd /d "%~dp0server"
if not exist node_modules (
  echo Installing server dependencies...
  call npm install
)
call npm run dev
