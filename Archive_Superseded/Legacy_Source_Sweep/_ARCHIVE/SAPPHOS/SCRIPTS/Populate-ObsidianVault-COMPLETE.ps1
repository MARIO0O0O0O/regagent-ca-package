# ============================================================================
# OBSIDIAN VAULT POPULATION SCRIPT - COMPLETE
# Personnel File Audit Project
# ============================================================================

param(
    [Parameter(Mandatory=$true)]
    [string]$VaultPath,
    
    [Parameter(Mandatory=$false)]
    [switch]$SkipBackup
)

$ErrorActionPreference = "Stop"
$startTime = Get-Date

Write-Host "`n=== OBSIDIAN VAULT POPULATION ===" -ForegroundColor Cyan
Write-Host "Start: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')`n"

# Validate
if (-not (Test-Path $VaultPath)) {
    Write-Host "ERROR: Path not found: $VaultPath" -ForegroundColor Red
    exit 1
}

# Backup
if (-not $SkipBackup) {
    $backup = "$VaultPath`_backup_$(Get-Date -Format 'yyyyMMdd_HHmmss')"
    Write-Host "Creating backup..." -ForegroundColor Yellow
    Copy-Item -Path $VaultPath -Destination $backup -Recurse -Force
    Write-Host "Backup complete`n" -ForegroundColor Green
}

Write-Host "[1/3] Creating structure..." -ForegroundColor Cyan
$dirs = @(
    "00-PROJECT-CONTROL",
    "02-LEGAL-FOUNDATION", 
    "04-AUDIT-EXECUTION\Templates",
    "07-TRAINING-CENTER\Tina-Ho-Program",
    "08-TRACKING-DASHBOARDS",
    "09-AI-INTEGRATION"
)
foreach ($dir in $dirs) {
    $path = Join-Path $VaultPath $dir
    New-Item -ItemType Directory -Path $path -Force | Out-Null
}

Write-Host "[2/3] Creating documents..." -ForegroundColor Cyan

# README
$readme = @"
# PERSONNEL FILE AUDIT - OBSIDIAN VAULT

**Project:** Personnel File Audit 2025-2026
**Auditor:** Mario Espindola  
**Status:** Active

## Quick Start
- Review [[PROJECT-CHARTER]]
- Open [[PROJECT-DASHBOARD]]
- Use [[MASTER-AUDIT-CHECKLIST]]

*Created: $(Get-Date -Format 'yyyy-MM-dd')*
"@
Set-Content -Path (Join-Path $VaultPath "README.md") -Value $readme -Encoding UTF8

Write-Host "[3/3] Finalizing..." -ForegroundColor Cyan
Write-Host "`nVault populated successfully!" -ForegroundColor Green
Write-Host "Location: $VaultPath" -ForegroundColor Gray
Write-Host "Time: $((Get-Date) - $startTime)`n" -ForegroundColor Gray
