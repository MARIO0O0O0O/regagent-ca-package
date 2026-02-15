# ============================================================================
# FRESH START - CLEAN VAULT REBUILD
# Based on Perplexity research: Minimal structure, Git-ready, BookStack-compatible
# ============================================================================

param(
    [Parameter(Mandatory=$false)]
    [string]$VaultPath = "C:\Users\mespindola\Documents\HR-Audit",
    
    [Parameter(Mandatory=$false)]
    [switch]$SkipBackup
)

$ErrorActionPreference = "Stop"
$startTime = Get-Date

Write-Host "`n===============================================" -ForegroundColor Cyan
Write-Host "FRESH START - VAULT REBUILD" -ForegroundColor Cyan
Write-Host "===============================================`n" -ForegroundColor Cyan

# Step 1: Backup old vault
if (Test-Path $VaultPath) {
    if (-not $SkipBackup) {
        $backupPath = "$VaultPath`_OLD_$(Get-Date -Format 'yyyyMMdd_HHmmss')"
        Write-Host "[1/4] Backing up old vault..." -ForegroundColor Yellow
        Write-Host "      From: $VaultPath" -ForegroundColor Gray
        Write-Host "      To:   $backupPath" -ForegroundColor Gray
        
        Move-Item -Path $VaultPath -Destination $backupPath -Force
        Write-Host "      Backup complete!`n" -ForegroundColor Green
    } else {
        Write-Host "[1/4] Removing old vault (no backup)..." -ForegroundColor Yellow
        Remove-Item -Path $VaultPath -Recurse -Force
        Write-Host "      Old vault deleted!`n" -ForegroundColor Green
    }
} else {
    Write-Host "[1/4] No existing vault found. Creating fresh...`n" -ForegroundColor Yellow
}

# Step 2: Create clean structure
Write-Host "[2/4] Creating clean vault structure..." -ForegroundColor Yellow

New-Item -ItemType Directory -Path $VaultPath -Force | Out-Null

# Minimal folders based on Perplexity recommendations
$folders = @(
    "01-PROJECT",           # Project Charter, Timeline
    "02-AUDIT",            # Audit checklists, templates
    "03-TRAINING",         # Tina's training materials
    "04-LEGAL",            # Legal authorities, research
    "05-TRACKING",         # Dashboards, progress
    ".git"                 # Git-ready for version control
)

foreach ($folder in $folders) {
    $folderPath = Join-Path $VaultPath $folder
    New-Item -ItemType Directory -Path $folderPath -Force | Out-Null
}

Write-Host "      Structure created!`n" -ForegroundColor Green

# Step 3: Create essential files
Write-Host "[3/4] Creating essential documents..." -ForegroundColor Yellow

# README
$readme = @"
# PERSONNEL FILE AUDIT - HR-AUDIT VAULT

**Project:** Personnel File Audit 2025-2026  
**Auditor:** Mario Espindola (Interim HR Manager / HR Auditor)  
**Support:** Tina Ho (Administrative Staff)  
**Employees:** 47-50  
**Timeline:** 23 working days (Dec 17, 2025 - Jan 28, 2026)

## Quick Start

1. **Review Project Charter:** [[01-PROJECT/PROJECT-CHARTER]]
2. **Start Audit:** [[02-AUDIT/MASTER-CHECKLIST]]
3. **Train Tina:** [[03-TRAINING/TINA-PROGRAM]]
4. **Check Progress:** [[05-TRACKING/DASHBOARD]]

## Vault Structure

- **01-PROJECT/** - Project charter, timeline, scope
- **02-AUDIT/** - Master checklist, templates, procedures
- **03-TRAINING/** - Tina's confidentiality training & curriculum
- **04-LEGAL/** - Legal authorities, compliance research
- **05-TRACKING/** - Progress dashboards, metrics

## Future Integration

This vault is designed to integrate with:
- **BookStack** - Enterprise policy management (when ready)
- **Temporal** - Workflow automation (future)
- **GitLab** - Version control (already Git-ready)

---

*Created: $(Get-Date -Format 'yyyy-MM-dd')*  
*Last Updated: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')*
"@

Set-Content -Path (Join-Path $VaultPath "README.md") -Value $readme -Encoding UTF8

# .gitignore
$gitignore = @"
# Obsidian
.obsidian/workspace.json
.obsidian/workspace-mobile.json

# Sensitive data
*.env
*-CONFIDENTIAL-*
*-PII-*

# Backups
*_backup_*
*_OLD_*

# System files
.DS_Store
Thumbs.db
"@

Set-Content -Path (Join-Path $VaultPath ".gitignore") -Value $gitignore -Encoding UTF8

Write-Host "      README.md created" -ForegroundColor Green
Write-Host "      .gitignore created`n" -ForegroundColor Green

# Step 4: Summary
Write-Host "[4/4] Summary" -ForegroundColor Yellow
Write-Host "      Vault location: $VaultPath" -ForegroundColor Gray
Write-Host "      Folders created: $($folders.Count)" -ForegroundColor Gray
Write-Host "      Time elapsed: $((Get-Date) - $startTime)`n" -ForegroundColor Gray

Write-Host "===============================================" -ForegroundColor Green
Write-Host "VAULT READY FOR CONTENT!" -ForegroundColor Green
Write-Host "===============================================`n" -ForegroundColor Green

Write-Host "Next Steps:" -ForegroundColor Cyan
Write-Host "1. Download the 4 core documents" -ForegroundColor White
Write-Host "2. Place them in the appropriate folders" -ForegroundColor White
Write-Host "3. Initialize Git: cd '$VaultPath' && git init" -ForegroundColor White
Write-Host "4. Open in Obsidian`n" -ForegroundColor White
