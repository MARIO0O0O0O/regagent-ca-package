<#
.SYNOPSIS
    Module 1: Personnel Audit Laboratory - Vault Foundation Setup
#>

[CmdletBinding()]
param(
    [Parameter(Mandatory=$false)]
    [string]$VaultPath = "C:\Users\mespindola\Documents\HRM\PERSONNEL RECORD AUDIT PROJECT"
)

#Requires -Version 5.1
$ErrorActionPreference = "Stop"

# Simplified output functions (No special characters to avoid encoding errors)
function Write-Success { param([string]$Message); Write-Host "[OK] $Message" -ForegroundColor Green }
function Write-Info { param([string]$Message); Write-Host "[INFO] $Message" -ForegroundColor Cyan }
function Write-Warning { param([string]$Message); Write-Host "[WARN] $Message" -ForegroundColor Yellow }
function Write-Error { param([string]$Message); Write-Host "[ERROR] $Message" -ForegroundColor Red }

try {
    Write-Info "Starting Module 1: Vault Foundation Setup"
    Write-Info "Target Path: ${VaultPath}"
    
    # 1. Create root directory
    if (-not (Test-Path $VaultPath)) {
        New-Item -ItemType Directory -Path $VaultPath -Force | Out-Null
        Write-Success "Created vault root folder."
    }

    # 2. Create folder structure
    $folders = @(
        "01-Employees", "02-Compliance-Framework", "03-Gap-Analysis", 
        "04-Information-Silos", "05-Daily-Progress", "06-Final-Report",
        "07-AI-Assistant", "07-AI-Assistant\Prompts", "08-Knowledge-Base",
        "08-Knowledge-Base\Obsidian-Guide", "09-Templates", "10-Assets",
        ".obsidian", ".obsidian\plugins"
    )
    
    foreach ($f in $folders) {
        $fullPath = Join-Path $VaultPath $f
        if (-not (Test-Path $fullPath)) {
            New-Item -ItemType Directory -Path $fullPath -Force | Out-Null
        }
    }
    Write-Success "Created 14 core audit directories."

    # 3. Create Master Plan File
    $planPath = Join-Path $VaultPath "00-MASTER-AUDIT-PLAN.md"
    $planContent = @"
# MASTER AUDIT PLAN
Project: Personnel Record Audit
Vault Path: ${VaultPath}
Status: Initialized

## Navigation
- [[01-Employees/Audit-Index|Employee Index]]
- [[02-Compliance-Framework/Checklist|Compliance Checklist]]
- [[08-Knowledge-Base/Getting-Started|Guide]]
"@
    Set-Content -Path $planPath -Value $planContent -Encoding UTF8

    # 4. Create Obsidian Configs
    $config = @{ "alwaysUpdateLinks" = $true; "attachmentFolderPath" = "10-Assets" } | ConvertTo-Json
    Set-Content -Path (Join-Path $VaultPath ".obsidian\app.json") -Value $config -Encoding UTF8
    Set-Content -Path (Join-Path $VaultPath ".obsidian\community-plugins.json") -Value "[]" -Encoding UTF8

    # 5. Create the Tracker File (Crucial for Module 2)
    $trackerPath = Join-Path $VaultPath ".module-tracker.json"
    $trackerData = @{
        "module1" = @{ "completed" = $true; "timestamp" = (Get-Date -Format "o") }
        "module2" = @{ "completed" = $false }
    } | ConvertTo-Json
    Set-Content -Path $trackerPath -Value $trackerData -Encoding UTF8

    Write-Host "`n****************************************" -ForegroundColor Cyan
    Write-Host "   MODULE 1 COMPLETED SUCCESSFULLY" -ForegroundColor Green
    Write-Host "****************************************`n"
    
    # Open the folder to show it worked
    Invoke-Item $VaultPath

} catch {
    Write-Error "Module 1 failed: $($_.Exception.Message)"
}