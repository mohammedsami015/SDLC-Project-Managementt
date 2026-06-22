@echo off
echo Starting SDLC PM Client...
cd /d "%~dp0client"
if not exist node_modules (
  echo Installing client dependencies...
  call npm install
)
call npm run dev
