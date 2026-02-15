# ======================================================
# Open Interpreter Safe Installer (Windows / PowerShell 7)
# Enforces Python 3.13 (avoids tiktoken build failures)
# ======================================================

$ErrorActionPreference = 'Stop'

function Write-Step {
    param ([string]$Message)
    Write-Host "`n=== $Message ===" -ForegroundColor Cyan
}

function Write-Ok {
    param ([string]$Message)
    Write-Host "✔ $Message" -ForegroundColor Green
}

function Write-Warn {
    param ([string]$Message)
    Write-Host "⚠ $Message" -ForegroundColor Yellow
}

function Write-Fail {
    param ([string]$Message)
    Write-Host "✖ $Message" -ForegroundColor Red
    exit 1
}

# ------------------------------------------------------
# 1. Verify PowerShell 7
# ------------------------------------------------------
Write-Step "Checking PowerShell version"

if ($PSVersionTable.PSVersion.Major -lt 7) {
    Write-Fail "PowerShell 7+ is required. Current version: $($PSVersionTable.PSVersion)"
}

Write-Ok "PowerShell $($PSVersionTable.PSVersion) detected"

# ------------------------------------------------------
# 2. Verify Python Launcher
# ------------------------------------------------------
Write-Step "Checking Python launcher (py.exe)"

if (-not (Get-Command py -ErrorAction SilentlyContinue)) {
    Write-Fail "Python launcher (py.exe) not found. Install Python from python.org."
}

Write-Ok "Python launcher detected"

# ------------------------------------------------------
# 3. Verify Python 3.13 availability
# ------------------------------------------------------
Write-Step "Checking for Python 3.13"

$pyList = py -0 2>$null

if ($pyList -notmatch '3\.13') {
    Write-Fail @"
Python 3.13 (64-bit) is required but not installed.

Download and install Python 3.13 from:
https://www.python.org/downloads/windows/

Then re-run this script.
"@
}

Write-Ok "Python 3.13 detected"

# ------------------------------------------------------
# 4. Upgrade pip (Python 3.13)
# ------------------------------------------------------
Write-Step "Upgrading pip (Python 3.13)"

py -3.13 -m pip install --upgrade pip --quiet
Write-Ok "pip upgraded successfully"

# ------------------------------------------------------
# 5. Self-healing: remove broken installs
# ------------------------------------------------------
Write-Step "Removing any existing Open Interpreter installs (if present)"

try {
    py -3.13 -m pip uninstall -y open-interpreter interpreter tiktoken *> $null
    Write-Ok "Previous installs removed"
}
catch {
    Write-Warn "No prior installs found"
}

# ------------------------------------------------------
# 6. Install Open Interpreter
# ------------------------------------------------------
Write-Step "Installing Open Interpreter"

py -3.13 -m pip install open-interpreter
Write-Ok "Open Interpreter installed"

# ------------------------------------------------------
# 7. Verify critical dependency: tiktoken
# ------------------------------------------------------
Write-Step "Verifying tiktoken import"

$tiktokenCheck = py -3.13 -c "import tiktoken; print('tiktoken OK')"

if ($tiktokenCheck -notmatch 'OK') {
    Write-Fail "tiktoken failed to import — installation is not usable"
}

Write-Ok "tiktoken verified"

# ------------------------------------------------------
# 8. Verify Open Interpreter
# ------------------------------------------------------
Write-Step "Verifying Open Interpreter startup"

$oiVersion = py -3.13 -m interpreter --version 2>$null

if (-not $oiVersion) {
    Write-Fail "Open Interpreter failed to start"
}

Write-Ok "Open Interpreter installed successfully: $oiVersion"

# ------------------------------------------------------
# 9. Success
# ------------------------------------------------------
Write-Host "`n🎉 Open Interpreter installation completed successfully." -ForegroundColor Green
Write-Host "Run Open Interpreter with:" -ForegroundColor White
Write-Host "  py -3.13 -m interpreter" -ForegroundColor Cyan

