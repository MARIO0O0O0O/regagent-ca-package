# Obsidian Vault Reorganization Script - FIXED VERSION
# Purpose: Consolidate fragmented vault structure and add project communications
# Date: January 2, 2026
# Fixed: Removed all Unicode characters for Windows compatibility

Write-Host "`n================================================================================" -ForegroundColor Cyan
Write-Host "OBSIDIAN VAULT REORGANIZATION" -ForegroundColor Cyan
Write-Host "================================================================================`n" -ForegroundColor Cyan

$VaultPath = "C:\Users\mespindola\Documents\HR-Audit"
$BackupPath = "C:\Users\mespindola\Documents\HR-Audit-BACKUP-$(Get-Date -Format 'yyyyMMdd-HHmmss')"

# Verify vault exists
if (-not (Test-Path $VaultPath)) {
    Write-Host "ERROR: Vault path not found: $VaultPath" -ForegroundColor Red
    Write-Host "Please verify the vault location and try again." -ForegroundColor Yellow
    Read-Host "Press Enter to exit"
    exit 1
}

# Create backup
Write-Host "[1/5] Creating backup..." -ForegroundColor Yellow
Write-Host "Backup location: $BackupPath" -ForegroundColor Cyan

try {
    Copy-Item -Path $VaultPath -Destination $BackupPath -Recurse -Force
    Write-Host "SUCCESS: Backup created!" -ForegroundColor Green
} catch {
    Write-Host "ERROR: Failed to create backup: $($_.Exception.Message)" -ForegroundColor Red
    Read-Host "Press Enter to exit"
    exit 1
}

# Define new consolidated structure (15 main folders)
Write-Host "`n[2/5] Building consolidated folder structure..." -ForegroundColor Yellow

$NewFolders = @(
    "00-PROJECT-OVERVIEW",
    "01-COMMUNICATIONS",
    "02-GUSTO-INTEGRATION",
    "03-EMPLOYEE-FILES",
    "03-EMPLOYEE-FILES/Batch-1-Employees-01-16",
    "03-EMPLOYEE-FILES/Batch-2-Employees-17-32",
    "03-EMPLOYEE-FILES/Batch-3-Employees-33-47",
    "04-AUDIT-CHECKLISTS",
    "05-POLICY-LIBRARY",
    "05-POLICY-LIBRARY/Current-Policies",
    "06-AI-ANALYSIS",
    "06-AI-ANALYSIS/AI-Review-Scripts",
    "06-AI-ANALYSIS/Compliance-Scoring",
    "06-AI-ANALYSIS/Findings-Reports",
    "07-FINDINGS-REPORTS",
    "07-FINDINGS-REPORTS/Individual-Employee-Reports",
    "08-REMEDIATION-PLANNING",
    "09-TRAINING-MATERIALS",
    "09-TRAINING-MATERIALS/Tina-HR-101-Program",
    "09-TRAINING-MATERIALS/Confidentiality-Training",
    "10-ADMINISTRATIVE-SUPPORT",
    "10-ADMINISTRATIVE-SUPPORT/Daily-Assignments",
    "10-ADMINISTRATIVE-SUPPORT/Progress-Tracking",
    "10-ADMINISTRATIVE-SUPPORT/Completed-Work",
    "11-SCRIPTS-AND-AUTOMATION",
    "11-SCRIPTS-AND-AUTOMATION/PowerShell-Scripts",
    "12-REFERENCE-MATERIALS",
    "12-REFERENCE-MATERIALS/Legal-Research",
    "SECURE-DATA",
    "SECURE-DATA/Confidential-Files",
    "TEMPLATES",
    "TEMPLATES/Email-Templates",
    "TEMPLATES/Report-Templates",
    "ARCHIVE",
    "ARCHIVE/Deprecated-Scripts"
)

$createdCount = 0
foreach ($folder in $NewFolders) {
    $folderPath = Join-Path $VaultPath $folder
    if (-not (Test-Path $folderPath)) {
        try {
            New-Item -Path $folderPath -ItemType Directory -Force | Out-Null
            $createdCount++
            Write-Host "  Created: $folder" -ForegroundColor Green
        } catch {
            Write-Host "  WARNING: Could not create $folder - $($_.Exception.Message)" -ForegroundColor Yellow
        }
    } else {
        Write-Host "  Exists: $folder" -ForegroundColor Gray
    }
}

Write-Host "`nCreated $createdCount new folders" -ForegroundColor Cyan

# Copy project communications to vault
Write-Host "`n[3/5] Adding project communications to vault..." -ForegroundColor Yellow

$CommunicationsFolder = Join-Path $VaultPath "01-COMMUNICATIONS"
$downloadsPath = "C:\Users\mespindola\Downloads"

# Files to look for and copy
$FilesToFind = @(
    "Email-to-Emer-Complete.md",
    "Executive-Summary-Questions.md",
    "Questions-Block-Standalone.md",
    "Executive-Project-Charter.md",
    "Subscription-Request-Condensed.md"
)

$copiedCount = 0
foreach ($fileName in $FilesToFind) {
    # Check Downloads folder first
    $sourcePath = Join-Path $downloadsPath $fileName
    
    if (Test-Path $sourcePath) {
        # Determine destination
        $destFolder = if ($fileName -match "Charter|Subscription") { 
            Join-Path $VaultPath "00-PROJECT-OVERVIEW" 
        } else { 
            $CommunicationsFolder 
        }
        
        # Create dated filename for communications
        $destFileName = if ($fileName -match "Email|Executive|Questions") {
            "$($fileName.Replace('.md', ''))-$(Get-Date -Format 'yyyy-MM-dd').md"
        } else {
            $fileName
        }
        
        $destPath = Join-Path $destFolder $destFileName
        
        try {
            Copy-Item -Path $sourcePath -Destination $destPath -Force
            Write-Host "  Copied: $fileName -> $destFileName" -ForegroundColor Green
            $copiedCount++
        } catch {
            Write-Host "  WARNING: Could not copy $fileName - $($_.Exception.Message)" -ForegroundColor Yellow
        }
    } else {
        Write-Host "  Not found: $fileName (skipping)" -ForegroundColor DarkGray
    }
}

Write-Host "`nCopied $copiedCount project files to vault" -ForegroundColor Cyan

# Create HOME.md navigation file
Write-Host "`n[4/5] Creating navigation system..." -ForegroundColor Yellow

$HomeContent = @"
# HR AUDIT VAULT - MASTER INDEX

**Project:** 47-Employee Personnel File Audit
**Timeline:** December 17, 2025 - January 28, 2026
**Status:** ON TRACK | 15% Complete

================================================================================

## QUICK START

**New to this vault?** Start here:
1. Project Overview: 00-PROJECT-OVERVIEW/README.md
2. Project Charter: 00-PROJECT-OVERVIEW/Executive-Project-Charter-*.md
3. Master Audit Checklist: 04-AUDIT-CHECKLISTS/

**Daily Work:**
- Tina's Dashboard: 10-ADMINISTRATIVE-SUPPORT/00-TINA-DASHBOARD.md
- Latest Findings: 07-FINDINGS-REPORTS/
- Priority Actions: 08-REMEDIATION-PLANNING/

================================================================================

## VAULT STRUCTURE

### Core Project Documents
- 00-PROJECT-OVERVIEW/ - Executive summaries and charter
- 01-COMMUNICATIONS/ - Emails and updates
- 04-AUDIT-CHECKLISTS/ - Compliance requirements

### Employee Data & Analysis
- 02-GUSTO-INTEGRATION/ - Employee data sync
- 03-EMPLOYEE-FILES/ - Scanned personnel files (47 employees)
- 06-AI-ANALYSIS/ - Automated compliance review

### Results & Planning
- 05-POLICY-LIBRARY/ - Company policies
- 07-FINDINGS-REPORTS/ - Audit results
- 08-REMEDIATION-PLANNING/ - Action plans

### Support & Resources
- 09-TRAINING-MATERIALS/ - Tina's HR 101 program
- 10-ADMINISTRATIVE-SUPPORT/ - Tina's tasks
- 11-SCRIPTS-AND-AUTOMATION/ - PowerShell tools
- 12-REFERENCE-MATERIALS/ - Legal research

### System Folders
- SECURE-DATA/ - Confidential files (encrypted)
- TEMPLATES/ - Reusable templates
- ARCHIVE/ - Deprecated documents

================================================================================

## PROJECT DASHBOARD

### Progress Tracking
- Phase 1 (Planning): 60% complete
- Phase 2 (Scanning): 0% complete
- Phase 3 (AI Review): 0% complete
- Phase 4 (Reporting): 0% complete

### Next Milestones
- [ ] Batch 1 scanning complete - Jan 2, 2026
- [ ] All scanning complete - Jan 9, 2026
- [ ] AI review complete - Jan 23, 2026
- [ ] Final delivery - Jan 28, 2026

### Active Blockers
- Laptop performance (crashes daily - upgrade requested)
- Workspace allocation (fishbowl office pending approval)
- Tina availability (clarification needed)

================================================================================

## FREQUENTLY ACCESSED

### Latest Documents
- Latest Email to Emer: 01-COMMUNICATIONS/
- Current Project Charter: 00-PROJECT-OVERVIEW/
- Tina's Current Tasks: 10-ADMINISTRATIVE-SUPPORT/

### Key Checklists
- Master Audit Checklist: 04-AUDIT-CHECKLISTS/
- Confidentiality Training: 09-TRAINING-MATERIALS/

### Reports & Analysis
- Top 10 Compliance Gaps: 07-FINDINGS-REPORTS/
- Legal Risk Assessment: 07-FINDINGS-REPORTS/
- Remediation Roadmap: 08-REMEDIATION-PLANNING/

================================================================================

**Last Updated:** $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')
**Vault Version:** 2.0 (Reorganized)
**Backup Location:** $BackupPath

================================================================================

## NEXT STEPS

1. Review 00-PROJECT-OVERVIEW/README.md for project details
2. Check 01-COMMUNICATIONS/ for latest updates to Emer
3. Open 10-ADMINISTRATIVE-SUPPORT/00-TINA-DASHBOARD.md for daily tasks
4. Explore folder structure using left sidebar in Obsidian

For questions: Contact Mario Espindola, HR Auditor
"@

$HomePath = Join-Path $VaultPath "HOME.md"
try {
    $HomeContent | Out-File -FilePath $HomePath -Encoding UTF8 -Force
    Write-Host "  Created: HOME.md (Master Index)" -ForegroundColor Green
} catch {
    Write-Host "  WARNING: Could not create HOME.md - $($_.Exception.Message)" -ForegroundColor Yellow
}

# Create README in 00-PROJECT-OVERVIEW
$ReadmeContent = @"
# Personnel File Audit - Project Overview

**Project Duration:** December 17, 2025 - January 28, 2026 (23 working days)
**Scope:** 47 employees
**Lead:** Mario Espindola, HR Auditor
**Support:** Tina Ho, Administrative Staff

================================================================================

## PROJECT DOCUMENTS IN THIS FOLDER

- Executive-Project-Charter-*.md - Complete project details
- Subscription-Request.md - Budget approval request
- README.md - This file

## QUICK LINKS

### Communications
- Latest updates to Controller: ../01-COMMUNICATIONS/

### Key Folders
- Employee Files: ../03-EMPLOYEE-FILES/
- Audit Checklists: ../04-AUDIT-CHECKLISTS/
- Findings and Reports: ../07-FINDINGS-REPORTS/
- Tina's Training: ../09-TRAINING-MATERIALS/

================================================================================

## PROJECT STATUS

**Current Phase:** Phase 1 - Planning (60% complete)
**Overall Progress:** 15% complete
**Next Milestone:** Batch 1 scanning complete - January 2, 2026

================================================================================

## VAULT ORGANIZATION

This vault is organized into 15 main sections - see HOME.md for complete index.

**Last Updated:** $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')
**Vault Version:** 2.0 (Reorganized)
"@

$ReadmePath = Join-Path $VaultPath "00-PROJECT-OVERVIEW\README.md"
try {
    $ReadmeContent | Out-File -FilePath $ReadmePath -Encoding UTF8 -Force
    Write-Host "  Created: 00-PROJECT-OVERVIEW/README.md" -ForegroundColor Green
} catch {
    Write-Host "  WARNING: Could not create README.md - $($_.Exception.Message)" -ForegroundColor Yellow
}

# Clean up duplicate folders
Write-Host "`n[5/5] Cleaning up duplicate folders..." -ForegroundColor Yellow

$duplicatesToRemove = @(
    "02-EMPLOYEE-FILES",
    "04-COMPLIANCE-RESEARCH",
    "06-REMEDIATION-TRACKING",
    "06-VISUAL-ANALYTICS",
    "08-VISUAL-ASSETS",
    "10-CITATIONS-BIBLIOGRAPHY",
    "Checklists",
    "Compliance-Summaries",
    "Tags"
)

$removedCount = 0
foreach ($duplicate in $duplicatesToRemove) {
    $dupPath = Join-Path $VaultPath $duplicate
    if (Test-Path $dupPath) {
        # Check if it's empty
        $items = Get-ChildItem -Path $dupPath -Recurse -ErrorAction SilentlyContinue
        if ($items.Count -eq 0) {
            try {
                Remove-Item -Path $dupPath -Recurse -Force
                Write-Host "  Removed empty duplicate: $duplicate" -ForegroundColor Green
                $removedCount++
            } catch {
                Write-Host "  WARNING: Could not remove $duplicate - $($_.Exception.Message)" -ForegroundColor Yellow
            }
        } else {
            Write-Host "  Skipped (has content): $duplicate - manually review" -ForegroundColor Yellow
        }
    }
}

Write-Host "`nRemoved $removedCount empty duplicate folders" -ForegroundColor Cyan

# Summary
Write-Host "`n================================================================================" -ForegroundColor Green
Write-Host "REORGANIZATION COMPLETE!" -ForegroundColor Green
Write-Host "================================================================================`n" -ForegroundColor Green

Write-Host "Summary:" -ForegroundColor Cyan
Write-Host "  Backup created: $BackupPath" -ForegroundColor White
Write-Host "  New folders created: $createdCount" -ForegroundColor White
Write-Host "  Project files copied: $copiedCount" -ForegroundColor White
Write-Host "  Duplicate folders removed: $removedCount" -ForegroundColor White
Write-Host "  Navigation created: HOME.md" -ForegroundColor White

Write-Host "`nNext Steps:" -ForegroundColor Yellow
Write-Host "  1. Open vault in Obsidian: $VaultPath" -ForegroundColor White
Write-Host "  2. Start at HOME.md for navigation" -ForegroundColor White
Write-Host "  3. Review 00-PROJECT-OVERVIEW/README.md" -ForegroundColor White
Write-Host "  4. Move existing files into appropriate folders" -ForegroundColor White

Write-Host "`nBackup Location:" -ForegroundColor Yellow
Write-Host "  $BackupPath" -ForegroundColor White
Write-Host "  (Keep this backup until you verify the reorganization)`n" -ForegroundColor Gray

Write-Host "================================================================================" -ForegroundColor Green

# Offer to open vault in File Explorer
$response = Read-Host "`nWould you like to open the vault folder now? (Y/N)"
if ($response -eq 'Y' -or $response -eq 'y') {
    explorer $VaultPath
}

Write-Host "`nReorganization script completed successfully!" -ForegroundColor Green
Write-Host "================================================================================" -ForegroundColor Cyan