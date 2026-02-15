# Obsidian Vault Reorganization Script
# Purpose: Consolidate fragmented vault structure and add project communications
# Date: December 29, 2025

Write-Host "`n$('='*80)" -ForegroundColor Cyan
Write-Host "OBSIDIAN VAULT REORGANIZATION" -ForegroundColor Cyan
Write-Host "$('='*80)`n" -ForegroundColor Cyan

$VaultPath = "C:\Users\mespindola\Documents\HR-Audit"
$BackupPath = "C:\Users\mespindola\Documents\HR-Audit-BACKUP-$(Get-Date -Format 'yyyyMMdd-HHmmss')"
$TempOutputsPath = "/mnt/user-data/outputs"

# Verify vault exists
if (-not (Test-Path $VaultPath)) {
    Write-Host "ERROR: Vault path not found: $VaultPath" -ForegroundColor Red
    exit 1
}

# Create backup
Write-Host "[1/5] Creating backup..." -ForegroundColor Yellow
Write-Host "Backup location: $BackupPath" -ForegroundColor Cyan

try {
    Copy-Item -Path $VaultPath -Destination $BackupPath -Recurse -Force
    Write-Host "✓ Backup created successfully!" -ForegroundColor Green
} catch {
    Write-Host "ERROR: Failed to create backup: $($_.Exception.Message)" -ForegroundColor Red
    exit 1
}

# Define new consolidated structure
Write-Host "`n[2/5] Defining new vault structure..." -ForegroundColor Yellow

$NewStructure = @{
    "00-PROJECT-OVERVIEW" = @(
        "README.md",
        "Project-Charter.md",
        "Executive-Summary.md",
        "Timeline-and-Milestones.md"
    )
    "01-COMMUNICATIONS" = @(
        "Email-to-Emer.md",
        "Email-to-Tina.md",
        "Executive-Updates.md"
    )
    "02-GUSTO-INTEGRATION" = @(
        "Gusto-API-Sync.ps1",
        "Employee-Data-Pull.ps1",
        "Integration-Tests.md"
    )
    "03-EMPLOYEE-FILES" = @(
        "Batch-1-Employees-01-16/",
        "Batch-2-Employees-17-32/",
        "Batch-3-Employees-33-47/"
    )
    "04-AUDIT-CHECKLISTS" = @(
        "Master-Audit-Checklist.md",
        "Federal-Compliance-Requirements.md",
        "California-Compliance-Requirements.md",
        "Tier-1-Critical-Documents.md",
        "Tier-2-Important-Documents.md",
        "Tier-3-Recommended-Documents.md"
    )
    "05-POLICY-LIBRARY" = @(
        "Current-Policies/",
        "Policy-Audit-Findings.md",
        "Policy-Gap-Analysis.md",
        "Recommended-Policy-Updates.md"
    )
    "06-AI-ANALYSIS" = @(
        "AI-Review-Scripts/",
        "Compliance-Scoring/",
        "Findings-Reports/",
        "Pattern-Analysis/"
    )
    "07-FINDINGS-AND-REPORTS" = @(
        "Individual-Employee-Reports/",
        "Aggregate-Findings.md",
        "Top-10-Gaps.md",
        "Compliance-Heat-Map.md",
        "Legal-Risk-Assessment.md"
    )
    "08-REMEDIATION-PLANNING" = @(
        "Remediation-Roadmap.md",
        "Priority-Actions.md",
        "30-60-90-Day-Plan.md",
        "Budget-Estimates.md"
    )
    "09-TRAINING-MATERIALS" = @(
        "Tina-HR-101-Program/",
        "Confidentiality-Training/",
        "Reading-Library/",
        "Certificates/"
    )
    "10-ADMINISTRATIVE-SUPPORT" = @(
        "Tina-Dashboard.md",
        "Daily-Assignments/",
        "Progress-Tracking/",
        "Questions-For-Mario/",
        "Completed-Work/"
    )
    "11-SCRIPTS-AND-AUTOMATION" = @(
        "PowerShell-Scripts/",
        "Data-Processing/",
        "Report-Generation/",
        "Utilities/"
    )
    "12-REFERENCE-MATERIALS" = @(
        "Legal-Research/",
        "SHRM-Resources/",
        "California-Legislation/",
        "Federal-Regulations/",
        "Best-Practices/"
    )
    "SECURE-DATA" = @(
        "Confidential-Files/",
        "Medical-Records/",
        "Investigation-Files/",
        "Training-Records/"
    )
    "TEMPLATES" = @(
        "Email-Templates/",
        "Report-Templates/",
        "Form-Templates/",
        "Checklist-Templates/"
    )
    "ARCHIVE" = @(
        "Deprecated-Scripts/",
        "Old-Versions/",
        "Superseded-Documents/"
    )
}

# Create new structure
Write-Host "Creating consolidated folder structure..." -ForegroundColor Cyan

foreach ($folder in $NewStructure.Keys) {
    $folderPath = Join-Path $VaultPath $folder
    if (-not (Test-Path $folderPath)) {
        New-Item -Path $folderPath -ItemType Directory -Force | Out-Null
        Write-Host "  ✓ Created: $folder" -ForegroundColor Green
    } else {
        Write-Host "  - Exists: $folder" -ForegroundColor Gray
    }
    
    # Create subfolders
    foreach ($item in $NewStructure[$folder]) {
        if ($item.EndsWith('/')) {
            $subfolderPath = Join-Path $folderPath $item.TrimEnd('/')
            if (-not (Test-Path $subfolderPath)) {
                New-Item -Path $subfolderPath -ItemType Directory -Force | Out-Null
                Write-Host "    ✓ Created: $folder/$item" -ForegroundColor Green
            }
        }
    }
}

# Copy project communications from outputs to vault
Write-Host "`n[3/5] Adding project communications to vault..." -ForegroundColor Yellow

$CommunicationsFolder = Join-Path $VaultPath "01-COMMUNICATIONS"

# Map of files to copy
$FilesToCopy = @{
    "Email-to-Emer-Complete.md" = "Email-to-Emer-$(Get-Date -Format 'yyyy-MM-dd').md"
    "Executive-Summary-Questions.md" = "Executive-Summary-$(Get-Date -Format 'yyyy-MM-dd').md"
    "Questions-Block-Standalone.md" = "Questions-for-Emer.md"
}

foreach ($sourceFile in $FilesToCopy.Keys) {
    $sourcePath = Join-Path $TempOutputsPath $sourceFile
    $destFile = $FilesToCopy[$sourceFile]
    $destPath = Join-Path $CommunicationsFolder $destFile
    
    if (Test-Path $sourcePath) {
        Copy-Item -Path $sourcePath -Destination $destPath -Force
        Write-Host "  ✓ Copied: $destFile" -ForegroundColor Green
    } else {
        Write-Host "  ⚠ Not found: $sourceFile" -ForegroundColor Yellow
    }
}

# Copy project charter to vault
Write-Host "`n[4/5] Adding project charter to vault..." -ForegroundColor Yellow

$ProjectOverviewFolder = Join-Path $VaultPath "00-PROJECT-OVERVIEW"

$CharterFiles = @{
    "Executive-Project-Charter.md" = "Project-Charter-$(Get-Date -Format 'yyyy-MM-dd').md"
    "Subscription-Request-Condensed.md" = "Subscription-Request.md"
}

foreach ($sourceFile in $CharterFiles.Keys) {
    $sourcePath = Join-Path $TempOutputsPath $sourceFile
    $destFile = $CharterFiles[$sourceFile]
    $destPath = Join-Path $ProjectOverviewFolder $destFile
    
    if (Test-Path $sourcePath) {
        Copy-Item -Path $sourcePath -Destination $destPath -Force
        Write-Host "  ✓ Copied: $destFile" -ForegroundColor Green
    } else {
        Write-Host "  ⚠ Not found: $sourceFile" -ForegroundColor Yellow
    }
}

# Create README in project overview
$ReadmeContent = @"
# Personnel File Audit - Project Overview

**Project Duration:** December 17, 2025 - January 28, 2026 (23 working days)  
**Scope:** 47 employees  
**Lead:** Mario Espindola, HR Auditor  
**Support:** Tina Ho, Administrative Staff

---

## Quick Links

### Current Documents
- [Project Charter](./Project-Charter-$(Get-Date -Format 'yyyy-MM-dd').md) - Complete project details
- [Executive Summary](../01-COMMUNICATIONS/Executive-Summary-$(Get-Date -Format 'yyyy-MM-dd').md) - Latest status update
- [Timeline and Milestones](./Timeline-and-Milestones.md) - Project schedule

### Communications
- [Email to Emer](../01-COMMUNICATIONS/Email-to-Emer-$(Get-Date -Format 'yyyy-MM-dd').md) - Latest update to Controller
- [Subscription Request](./Subscription-Request.md) - Budget approval request

### Key Folders
- [Employee Files](../03-EMPLOYEE-FILES/) - Scanned personnel files
- [Audit Checklists](../04-AUDIT-CHECKLISTS/) - Compliance requirements
- [Findings and Reports](../07-FINDINGS-AND-REPORTS/) - Audit results
- [Tina's Training](../09-TRAINING-MATERIALS/Tina-HR-101-Program/) - HR 101 curriculum

---

## Project Status

**Current Phase:** Phase 1 - Planning (60% complete)  
**Overall Progress:** 15% complete  
**Next Milestone:** Batch 1 scanning complete - January 2, 2026

---

## Vault Organization

This vault is organized into 15 main sections:

1. **00-PROJECT-OVERVIEW** - Executive summaries, charter, timelines
2. **01-COMMUNICATIONS** - Emails, updates, correspondence
3. **02-GUSTO-INTEGRATION** - API sync, employee data pull
4. **03-EMPLOYEE-FILES** - Scanned personnel files (47 employees)
5. **04-AUDIT-CHECKLISTS** - Compliance requirements and checklists
6. **05-POLICY-LIBRARY** - Company policies and gap analysis
7. **06-AI-ANALYSIS** - AI review scripts and findings
8. **07-FINDINGS-AND-REPORTS** - Audit results and analysis
9. **08-REMEDIATION-PLANNING** - Action plans and timelines
10. **09-TRAINING-MATERIALS** - Tina's HR 101 program
11. **10-ADMINISTRATIVE-SUPPORT** - Tina's dashboard and tasks
12. **11-SCRIPTS-AND-AUTOMATION** - PowerShell scripts and tools
13. **12-REFERENCE-MATERIALS** - Legal research and resources
14. **SECURE-DATA** - Confidential files (encrypted)
15. **TEMPLATES** - Reusable templates
16. **ARCHIVE** - Deprecated or superseded documents

---

**Last Updated:** $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')  
**Vault Version:** 2.0 (Reorganized)
"@

$ReadmePath = Join-Path $ProjectOverviewFolder "README.md"
$ReadmeContent | Out-File -FilePath $ReadmePath -Encoding UTF8 -Force
Write-Host "  ✓ Created: README.md in Project Overview" -ForegroundColor Green

# Create vault index (master navigation)
Write-Host "`n[5/5] Creating vault master index..." -ForegroundColor Yellow

$MasterIndexContent = @"
---
tags: [index, navigation, vault-home]
---

# 📁 HR AUDIT VAULT - MASTER INDEX

**Project:** 47-Employee Personnel File Audit  
**Timeline:** December 17, 2025 - January 28, 2026  
**Status:** ✅ ON TRACK | 15% Complete

---

## 🚀 QUICK START

**New to this vault?** Start here:
1. [[00-PROJECT-OVERVIEW/README|Project Overview]]
2. [[00-PROJECT-OVERVIEW/Project-Charter-$(Get-Date -Format 'yyyy-MM-dd')|Project Charter]]
3. [[04-AUDIT-CHECKLISTS/Master-Audit-Checklist|Master Audit Checklist]]

**Daily Work:**
- [[10-ADMINISTRATIVE-SUPPORT/Tina-Dashboard|Tina's Dashboard]]
- [[07-FINDINGS-AND-REPORTS/Aggregate-Findings|Latest Findings]]
- [[08-REMEDIATION-PLANNING/Priority-Actions|Priority Actions]]

---

## 📂 VAULT STRUCTURE

### Core Project Documents
- [[00-PROJECT-OVERVIEW/README|📋 Project Overview]] - Executive summaries and charter
- [[01-COMMUNICATIONS/README|📧 Communications]] - Emails and updates
- [[04-AUDIT-CHECKLISTS/README|✅ Audit Checklists]] - Compliance requirements

### Employee Data & Analysis
- [[02-GUSTO-INTEGRATION/README|🔗 Gusto Integration]] - Employee data sync
- [[03-EMPLOYEE-FILES/README|👥 Employee Files]] - Scanned personnel files
- [[06-AI-ANALYSIS/README|🤖 AI Analysis]] - Automated compliance review

### Results & Planning
- [[05-POLICY-LIBRARY/README|📚 Policy Library]] - Company policies
- [[07-FINDINGS-AND-REPORTS/README|📊 Findings & Reports]] - Audit results
- [[08-REMEDIATION-PLANNING/README|🎯 Remediation Planning]] - Action plans

### Support & Resources
- [[09-TRAINING-MATERIALS/README|🎓 Training Materials]] - Tina's HR 101
- [[10-ADMINISTRATIVE-SUPPORT/README|👤 Administrative Support]] - Tina's tasks
- [[11-SCRIPTS-AND-AUTOMATION/README|⚙️ Scripts & Automation]] - PowerShell tools
- [[12-REFERENCE-MATERIALS/README|📖 Reference Materials]] - Legal research

### System Folders
- [[SECURE-DATA/README|🔒 Secure Data]] - Confidential files (encrypted)
- [[TEMPLATES/README|📄 Templates]] - Reusable templates
- [[ARCHIVE/README|📦 Archive]] - Deprecated documents

---

## 📊 PROJECT DASHBOARD

### Progress Tracking
- **Phase 1 (Planning):** 60% complete
- **Phase 2 (Scanning):** 0% complete  
- **Phase 3 (AI Review):** 0% complete
- **Phase 4 (Reporting):** 0% complete

### Next Milestones
- [ ] Batch 1 scanning complete - Jan 2, 2026
- [ ] All scanning complete - Jan 9, 2026
- [ ] AI review complete - Jan 23, 2026
- [ ] Final delivery - Jan 28, 2026

### Active Blockers
- 🔴 Laptop performance (crashes daily - upgrade requested)
- 🟡 Workspace allocation (fishbowl office pending approval)
- 🟡 Tina availability (clarification needed)

---

## 🔍 FREQUENTLY ACCESSED

### Latest Documents
- [[01-COMMUNICATIONS/Email-to-Emer-$(Get-Date -Format 'yyyy-MM-dd')|Latest Email to Emer]]
- [[00-PROJECT-OVERVIEW/Project-Charter-$(Get-Date -Format 'yyyy-MM-dd')|Current Project Charter]]
- [[10-ADMINISTRATIVE-SUPPORT/Tina-Dashboard|Tina's Current Tasks]]

### Key Checklists
- [[04-AUDIT-CHECKLISTS/Master-Audit-Checklist|Master Audit Checklist]]
- [[04-AUDIT-CHECKLISTS/Tier-1-Critical-Documents|Tier 1 Critical Documents]]
- [[09-TRAINING-MATERIALS/Confidentiality-Training/README|Confidentiality Training]]

### Reports & Analysis
- [[07-FINDINGS-AND-REPORTS/Top-10-Gaps|Top 10 Compliance Gaps]]
- [[07-FINDINGS-AND-REPORTS/Legal-Risk-Assessment|Legal Risk Assessment]]
- [[08-REMEDIATION-PLANNING/Remediation-Roadmap|Remediation Roadmap]]

---

## 🛠️ TOOLS & SCRIPTS

### Automation Scripts
- [[11-SCRIPTS-AND-AUTOMATION/PowerShell-Scripts/README|PowerShell Scripts]]
- [[02-GUSTO-INTEGRATION/Gusto-API-Sync|Gusto API Sync]]
- [[06-AI-ANALYSIS/AI-Review-Scripts/README|AI Review Scripts]]

### Templates
- [[TEMPLATES/Email-Templates/README|Email Templates]]
- [[TEMPLATES/Report-Templates/README|Report Templates]]
- [[TEMPLATES/Form-Templates/README|Form Templates]]

---

## 📞 CONTACTS & RESOURCES

**Project Team:**
- Mario Espindola - HR Auditor (Lead)
- Tina Ho - Administrative Staff (0.5 FTE)
- Emer [Last Name] - Controller (Oversight)

**External Resources:**
- SHRM Member Portal
- CalChamber HR Helpline
- Perplexity AI Pro (Legal Research)

---

**Last Updated:** $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')  
**Vault Version:** 2.0  
**Backup Location:** $BackupPath
"@

$MasterIndexPath = Join-Path $VaultPath "HOME.md"
$MasterIndexContent | Out-File -FilePath $MasterIndexPath -Encoding UTF8 -Force
Write-Host "  ✓ Created: HOME.md (Master Index)" -ForegroundColor Green

# Summary
Write-Host "`n$('='*80)" -ForegroundColor Green
Write-Host "REORGANIZATION COMPLETE!" -ForegroundColor Green
Write-Host "$('='*80)`n" -ForegroundColor Green

Write-Host "Summary:" -ForegroundColor Cyan
Write-Host "  ✓ Backup created: $BackupPath" -ForegroundColor Green
Write-Host "  ✓ New folder structure created (15 main sections)" -ForegroundColor Green
Write-Host "  ✓ Project communications added to vault" -ForegroundColor Green
Write-Host "  ✓ Project charter added to vault" -ForegroundColor Green
Write-Host "  ✓ Master index created (HOME.md)" -ForegroundColor Green
Write-Host "  ✓ README files created" -ForegroundColor Green

Write-Host "`nNext Steps:" -ForegroundColor Yellow
Write-Host "  1. Open vault in Obsidian: $VaultPath" -ForegroundColor White
Write-Host "  2. Start at HOME.md for navigation" -ForegroundColor White
Write-Host "  3. Review 00-PROJECT-OVERVIEW/README.md" -ForegroundColor White
Write-Host "  4. Move existing files into appropriate folders" -ForegroundColor White

Write-Host "`nBackup Location:" -ForegroundColor Yellow
Write-Host "  $BackupPath" -ForegroundColor White
Write-Host "  (Keep this backup until you verify the reorganization)" -ForegroundColor Gray

Write-Host "`n$('='*80)`n" -ForegroundColor Green
