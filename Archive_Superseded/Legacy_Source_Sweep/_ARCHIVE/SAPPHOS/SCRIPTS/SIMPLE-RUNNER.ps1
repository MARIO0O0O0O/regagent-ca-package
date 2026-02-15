# ULTIMATE SIMPLE RUNNER
# Copy this ENTIRE block into PowerShell and press Enter

Write-Host "`n$('='*80)" -ForegroundColor Cyan
Write-Host "DIRECTORY ANALYSIS & VAULT REORGANIZATION" -ForegroundColor Cyan
Write-Host "$('='*80)`n" -ForegroundColor Cyan

# Ensure Scripts folder exists
$scriptDir = "C:\Users\mespindola\Documents\SCRIPTS"
if (-not (Test-Path $scriptDir)) { 
    New-Item -Path $scriptDir -ItemType Directory -Force | Out-Null
}

Write-Host "[1/3] Checking for scripts in Downloads folder..." -ForegroundColor Yellow

# Check if scripts are already downloaded
$script1Path = "C:\Users\mespindola\Downloads\Analyze-Directory-Tree.ps1"
$script2Path = "C:\Users\mespindola\Downloads\Reorganize-Vault.ps1"

if (-not (Test-Path $script1Path) -or -not (Test-Path $script2Path)) {
    Write-Host "Scripts not found in Downloads. Please download them first:" -ForegroundColor Red
    Write-Host "1. Open Claude's response above" -ForegroundColor Yellow
    Write-Host "2. Click the download links for both scripts" -ForegroundColor Yellow
    Write-Host "3. Save to Downloads folder" -ForegroundColor Yellow
    Write-Host "4. Run this command again`n" -ForegroundColor Yellow
    exit
}

# Copy to Scripts folder
Write-Host "✓ Scripts found!`n" -ForegroundColor Green
Write-Host "[2/3] Copying to Scripts folder..." -ForegroundColor Yellow

Copy-Item -Path $script1Path -Destination "$scriptDir\Analyze-Directory-Tree.ps1" -Force
Copy-Item -Path $script2Path -Destination "$scriptDir\Reorganize-Vault.ps1" -Force

Write-Host "✓ Scripts ready in $scriptDir`n" -ForegroundColor Green

# Run analysis
Write-Host "[3/3] Running directory analysis..." -ForegroundColor Yellow
Write-Host "$('-'*80)`n" -ForegroundColor Gray

& "$scriptDir\Analyze-Directory-Tree.ps1"

# Ask about reorganization
Write-Host "`n$('='*80)" -ForegroundColor Cyan
$continue = Read-Host "Analysis complete. Run vault reorganization now? (Y/N)"

if ($continue -eq 'Y' -or $continue -eq 'y') {
    Write-Host "`nStarting vault reorganization..." -ForegroundColor Yellow
    Write-Host "Backup will be created automatically`n" -ForegroundColor Gray
    
    & "$scriptDir\Reorganize-Vault.ps1"
} else {
    Write-Host "`nSkipping reorganization for now." -ForegroundColor Yellow
    Write-Host "To run it later:" -ForegroundColor Cyan
    Write-Host "  cd C:\Users\mespindola\Documents\SCRIPTS" -ForegroundColor White
    Write-Host "  .\Reorganize-Vault.ps1`n" -ForegroundColor White
}

Write-Host "$('='*80)`n" -ForegroundColor Green
