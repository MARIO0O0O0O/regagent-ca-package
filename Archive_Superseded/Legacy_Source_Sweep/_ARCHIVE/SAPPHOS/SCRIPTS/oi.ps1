# ================================
# Open Interpreter Safe Installer
# Windows + PowerShell 7
# Python 3.13 enforced
# ================================

$ErrorActionPreference = "Stop"

function Write-Step {
    param ($Message)
    Write-Host "`n=== $Message ===" -ForegroundColor Cyan
}

function Write-Ok {
    param ($Message)
    Write-Host "✔ $Message" -ForegroundColor Green
}

function Write-Warn {
    param ($Message)
    Write-Host "⚠ $Message" -ForegroundColor Yellow
}

function Write-Fail {
    param ($Message)
    Write-Host "✖ $Message" -ForegroundColor Red
    exit 1
}

# -------------------------------
# 1. Verify PowerShell 7
# -------------------------------
Write-Step "Checking PowerShell version"

if ($PSVersionTable.PSVersion.Major -lt 7) {
    Write-Fail "PowerShell 7+ required. Current: $($PSVersionTable.PSVersion)"
}

Write-Ok "PowerShell $($PSVersionTable.PSVersion) detected"

# -------------------------------
# 2. Verify Python Launcher
# -------------------------------
Write-Step "Checking Python launcher (py)"

if (-not (Get-Command py -ErrorAction SilentlyContinue)) {
    Write-Fail "Python Launcher (py.exe) not found. Install Python from python.org."
}

Write-Ok "Python launcher detected"

# -------------------------------
# 3. Ensure Python 3.13 exists
# -------------------------------
Write-Step "Checking for Python 3.13"

$pyList = py -0 2>$null

if ($pyList -notmatch "3\.13") {
    Write-Fail @"
Python 3.13 is required but not found.

Install Python 3.13 (64-bit) from:
https://www.python.org/downloads/windows/

Re-run this script after installation.
"@
}

Write-Ok "Python 3.13 detected"

# -------------------------------
# 4. Upgrade pip (Python 3.13)
# -------------------------------
Write-Step "Upgrading pip (Python 3.13)"

py -3.13 -m pip install --upgrade pip --quiet
Write-Ok "pip upgraded"

# -------------------------------
# 5. Remove broken installs (self-healing)
# -------------------------------
Write-Step "Removing any broken Open Interpreter installs"

try {
    py -3.13 -m pip uninstall -y open-interpreter interpreter tiktoken *> $null
    Write-Ok "Previous installs cleaned (if any)"
}
catch {
    Write-Warn "No prior installs found"
}

# -------------------------------
# 6. Install Open Interpreter
# -------------------------------
Write-Step "Installing Open Interpreter (Python 3.13)"

py -3.13 -m pip install open-interpreter

# -------------------------------
# 7. Verify critical dependency (tiktoken)
# -------------------------------
Write-Step "Verifying tiktoken wheel"

$tiktokenCheck = py -3.13 - <<EOF
import tiktoken
print("tiktoken OK")
EOF

if ($tiktokenCheck -notmatch "OK") {
    Write-Fail "tiktoken failed to import (wheel issue)"
}

Write-Ok "tiktoken verified"

# -------------------------------
# 8. Verify Open Interpreter
# -------------------------------
Write-Step "Verifying Open Interpreter"

$oiVersion = py -3.13 -m interpreter --version 2>$null

if (-not $oiVersion) {
    Write-Fail "Open Interpreter did not start correctly"
}

Write-Ok "Open Interpreter installed: $oiVersion"

# -------------------------------
# 9. Success message
# -------------------------------
Write-Host "`n🎉 Open Interpreter installation successful!" -ForegroundColor Green
Write-Host "Run it with:" -ForegroundColor White
Write-Host "  py -3.13 -m interpreter" -ForegroundColor Cyan
