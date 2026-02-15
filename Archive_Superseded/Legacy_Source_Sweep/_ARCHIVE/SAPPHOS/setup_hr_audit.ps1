Write-Host "`n========================================" -ForegroundColor Cyan
Write-Host "HR Audit Workflow - Automated Setup" -ForegroundColor Cyan
Write-Host "========================================`n" -ForegroundColor Cyan

$VaultPath = "C:\Users\mespindola\Documents\HR-Audit"
$ScriptsPath = Join-Path $VaultPath "Scripts"
$PythonInstaller = "$env:TEMP\python-installer.exe"

function Test-Administrator {
    $currentUser = [Security.Principal.WindowsIdentity]::GetCurrent()
    $principal = New-Object Security.Principal.WindowsPrincipal($currentUser)
    return $principal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
}

Write-Host "[1/6] Checking Python installation..." -ForegroundColor Yellow

$pythonInstalled = $false
try {
    $pythonVersion = & python --version 2>&1
    if ($pythonVersion -match "Python 3\.") {
        Write-Host "  ✓ Python is installed: $pythonVersion" -ForegroundColor Green
        $pythonInstalled = $true
    }
} catch {
    Write-Host "  ✗ Python is not installed" -ForegroundColor Red
}

if (-not $pythonInstalled) {
    Write-Host "`n[2/6] Installing Python..." -ForegroundColor Yellow
    
    if (-not (Test-Administrator)) {
        Write-Host "  ⚠ WARNING: Not running as Administrator" -ForegroundColor Yellow
        Write-Host "  Python installation may require elevation" -ForegroundColor Yellow
    }
    
    Write-Host "  → Downloading Python installer..." -ForegroundColor Cyan
    
    $pythonUrl = "https://www.python.org/ftp/python/3.12.7/python-3.12.7-amd64.exe"
    
    try {
        Invoke-WebRequest -Uri $pythonUrl -OutFile $PythonInstaller -UseBasicParsing
        Write-Host "  ✓ Download complete" -ForegroundColor Green
        
        Write-Host "  → Installing Python (this may take 2-3 minutes)..." -ForegroundColor Cyan
        
        $installArgs = "/quiet InstallAllUsers=0 PrependPath=1 Include_pip=1 Include_test=0"
        Start-Process -FilePath $PythonInstaller -ArgumentList $installArgs -Wait -NoNewWindow
        
        Write-Host "  ✓ Python installation complete" -ForegroundColor Green
        
        $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
        
        Remove-Item $PythonInstaller -Force -ErrorAction SilentlyContinue
        
        Write-Host "`n  ⚠ IMPORTANT: Close and reopen PowerShell after this script completes" -ForegroundColor Yellow
        
    } catch {
        Write-Host "  ✗ Failed to install Python: $_" -ForegroundColor Red
        Write-Host "`n  Please install Python manually from: https://www.python.org/downloads/windows/" -ForegroundColor Yellow
        exit 1
    }
} else {
    Write-Host "`n[2/6] Python already installed - skipping installation" -ForegroundColor Green
}

Write-Host "`n[3/6] Verifying pip..." -ForegroundColor Yellow

try {
    $pipVersion = & python -m pip --version 2>&1
    if ($pipVersion -match "pip") {
        Write-Host "  ✓ pip is available: $pipVersion" -ForegroundColor Green
    }
} catch {
    Write-Host "  ✗ pip verification failed" -ForegroundColor Red
    Write-Host "  Attempting to repair pip..." -ForegroundColor Yellow
    
    try {
        & python -m ensurepip --upgrade
        Write-Host "  ✓ pip repaired successfully" -ForegroundColor Green
    } catch {
        Write-Host "  ✗ Failed to repair pip: $_" -ForegroundColor Red
        exit 1
    }
}

Write-Host "`n[4/6] Installing required Python packages..." -ForegroundColor Yellow
Write-Host "  (This may take 1-2 minutes)" -ForegroundColor Cyan

$packages = @("anthropic", "google-generativeai", "python-dotenv", "requests")

try {
    Write-Host "  → Installing: $($packages -join ', ')" -ForegroundColor Cyan
    
    & python -m pip install --quiet --upgrade anthropic google-generativeai python-dotenv requests
    
    Write-Host "  ✓ All packages installed successfully" -ForegroundColor Green
    
    Write-Host "`n  Verifying package installations:" -ForegroundColor Cyan
    foreach ($package in $packages) {
        try {
            $version = & python -m pip show $package 2>&1 | Select-String "Version:" | ForEach-Object { $_.ToString().Split()[1] }
            Write-Host "    ✓ $package $version" -ForegroundColor Green
        } catch {
            Write-Host "    ✗ $package not found" -ForegroundColor Red
        }
    }
    
} catch {
    Write-Host "  ✗ Package installation failed: $_" -ForegroundColor Red
    exit 1
}

Write-Host "`n[5/6] Creating folder structure..." -ForegroundColor Yellow

$folders = @(
    $VaultPath,
    (Join-Path $VaultPath "Checklists"),
    (Join-Path $VaultPath "Reports"),
    (Join-Path $VaultPath "Compliance-Summaries"),
    (Join-Path $VaultPath "Scripts"),
    (Join-Path $VaultPath "Templates"),
    (Join-Path $VaultPath ".vscode")
)

foreach ($folder in $folders) {
    if (-not (Test-Path $folder)) {
        New-Item -ItemType Directory -Path $folder -Force | Out-Null
        Write-Host "  ✓ Created: $folder" -ForegroundColor Green
    } else {
        Write-Host "  → Already exists: $folder" -ForegroundColor Gray
    }
}

Write-Host "`n[6/6] Creating .env template..." -ForegroundColor Yellow

$envPath = Join-Path $ScriptsPath ".env"

$envContent = @"
# API Keys - REPLACE WITH YOUR ACTUAL KEYS
ANTHROPIC_API_KEY=your_anthropic_key_here
GEMINI_API_KEY=your_gemini_key_here
PERPLEXITY_API_KEY=your_perplexity_key_here

# Obsidian Vault Path
VAULT_PATH=C:\Users\mespindola\Documents\HR-Audit
"@

Set-Content -Path $envPath -Value $envContent -Encoding UTF8
Write-Host "  ✓ Created .env template at: $envPath" -ForegroundColor Green

$gitignorePath = Join-Path $VaultPath ".gitignore"
$gitignoreContent = @"
Scripts/.env
__pycache__/
*.py[cod]
"@

Set-Content -Path $gitignorePath -Value $gitignoreContent -Encoding UTF8
Write-Host "  ✓ Created .gitignore" -ForegroundColor Green

Write-Host "`n========================================" -ForegroundColor Cyan
Write-Host "Setup Complete!" -ForegroundColor Cyan
Write-Host "========================================`n" -ForegroundColor Cyan

Write-Host "✓ Python and pip verified" -ForegroundColor Green
Write-Host "✓ Required packages installed" -ForegroundColor Green
Write-Host "✓ Folder structure created" -ForegroundColor Green
Write-Host "✓ .env template created" -ForegroundColor Green

Write-Host "`n📋 NEXT STEPS:" -ForegroundColor Yellow
Write-Host "1. Edit .env file with your API keys:" -ForegroundColor White
Write-Host "   $envPath" -ForegroundColor Cyan
Write-Host "`n2. If Python was just installed, close and reopen PowerShell" -ForegroundColor White

Write-Host "`nPress any key to exit..." -ForegroundColor Gray
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
