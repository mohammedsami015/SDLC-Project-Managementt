# Create GitHub repo and push SDLC Project Management
# Prerequisites: GitHub CLI installed and logged in (run: gh auth login)

$ErrorActionPreference = "Stop"
$repoPath = $PSScriptRoot

Set-Location $repoPath

$gh = "C:\Program Files\GitHub CLI\gh.exe"
if (-not (Test-Path $gh)) {
    $gh = (Get-Command gh -ErrorAction SilentlyContinue).Source
}

if (-not $gh) {
    Write-Host "GitHub CLI not found. Install from: https://cli.github.com/" -ForegroundColor Red
    Write-Host "Or create repo manually at https://github.com/new (name: sdlc-project-management) then run:"
    Write-Host "  git remote add origin https://github.com/mohammedsami015/sdlc-project-management.git"
    Write-Host "  git push -u origin main"
    exit 1
}

& $gh auth status
if ($LASTEXITCODE -ne 0) {
    Write-Host "Run: gh auth login" -ForegroundColor Yellow
    exit 1
}

& $gh repo create mohammedsami015/sdlc-project-management --public --source=. --remote=origin --push --description "MERN stack SDLC Project Management utility with Kanban task tracking"
Write-Host "Done! Repo: https://github.com/mohammedsami015/sdlc-project-management" -ForegroundColor Green
