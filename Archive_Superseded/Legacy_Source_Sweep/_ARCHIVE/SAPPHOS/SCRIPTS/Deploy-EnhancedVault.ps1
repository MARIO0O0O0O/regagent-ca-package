<#
.SYNOPSIS
    HR Audit Vault - Enhanced Modular Deployment System
.DESCRIPTION
    Deploys comprehensive audit vault with visual elements, indexing, policy tracking,
    and complete auditor toolkit. Optimized for focus support with extensive visuals.
.NOTES
    Author: HR Audit Project Team
    Version: 2.0
    Modules: 6 (Foundation, Visuals, Indexing, Policy, Citations, Audit Tools)
#>

param(
    [switch]$Module1,  # Foundation & Plugins
    [switch]$Module2,  # Visual Dashboard System
    [switch]$Module3,  # Document Indexing
    [switch]$Module4,  # Policy Management
    [switch]$Module5,  # Citation Library
    [switch]$Module6,  # Auditor's Toolkit
    [switch]$All       # Deploy everything
)

$VaultRoot = "C:\Users\mespindola\Documents\HR-Audit"
$ScriptsPath = "$VaultRoot\Scripts"

# Color scheme for visual consistency
$Colors = @{
    Critical = "🔴"
    Important = "🟡"
    Optional = "🟢"
    Complete = "✅"
    InProgress = "🔄"
    NotStarted = "⚪"
}

function Write-ModuleHeader {
    param([string]$ModuleName, [int]$ModuleNumber)
    Write-Host "`n╔════════════════════════════════════════════════════════════╗" -ForegroundColor Cyan
    Write-Host "║  MODULE $ModuleNumber : $ModuleName" -ForegroundColor Cyan
    Write-Host "╚════════════════════════════════════════════════════════════╝`n" -ForegroundColor Cyan
}

function Deploy-Module1-Foundation {
    Write-ModuleHeader "Foundation & Plugin Configuration" 1
    
    # Create comprehensive folder structure
    Write-Host "[1/8] Creating enhanced folder structure..." -ForegroundColor Yellow
    
    $folders = @(
        # Core folders
        "$VaultRoot\00-DASHBOARD",
        "$VaultRoot\01-AUDIT-PLANNING",
        "$VaultRoot\02-EMPLOYEE-FILES",
        "$VaultRoot\03-POLICY-LIBRARY",
        "$VaultRoot\04-COMPLIANCE-RESEARCH",
        "$VaultRoot\05-FINDINGS-REPORTS",
        "$VaultRoot\06-REMEDIATION-TRACKING",
        "$VaultRoot\07-CITATIONS-BIBLIOGRAPHY",
        "$VaultRoot\08-VISUAL-ASSETS",
        "$VaultRoot\09-TEMPLATES",
        
        # Subfolder: Dashboard
        "$VaultRoot\00-DASHBOARD\Daily",
        "$VaultRoot\00-DASHBOARD\Weekly",
        "$VaultRoot\00-DASHBOARD\Status-Reports",
        
        # Subfolder: Audit Planning
        "$VaultRoot\01-AUDIT-PLANNING\Timeline",
        "$VaultRoot\01-AUDIT-PLANNING\Checklists",
        "$VaultRoot\01-AUDIT-PLANNING\Scope-Documents",
        "$VaultRoot\01-AUDIT-PLANNING\Risk-Assessment",
        
        # Subfolder: Employee Files
        "$VaultRoot\02-EMPLOYEE-FILES\Personnel-Jackets",
        "$VaultRoot\02-EMPLOYEE-FILES\Confidential-Medical",
        "$VaultRoot\02-EMPLOYEE-FILES\I-9-Files",
        "$VaultRoot\02-EMPLOYEE-FILES\Investigation-Files",
        "$VaultRoot\02-EMPLOYEE-FILES\Scanned-Documents",
        
        # Subfolder: Policy Library
        "$VaultRoot\03-POLICY-LIBRARY\Required-Policies",
        "$VaultRoot\03-POLICY-LIBRARY\Recommended-Policies",
        "$VaultRoot\03-POLICY-LIBRARY\Training-Materials",
        "$VaultRoot\03-POLICY-LIBRARY\Policy-Tracking",
        
        # Subfolder: Compliance Research
        "$VaultRoot\04-COMPLIANCE-RESEARCH\Federal-Law",
        "$VaultRoot\04-COMPLIANCE-RESEARCH\California-State",
        "$VaultRoot\04-COMPLIANCE-RESEARCH\Local-Ordinances",
        "$VaultRoot\04-COMPLIANCE-RESEARCH\Case-Law",
        
        # Subfolder: Findings & Reports
        "$VaultRoot\05-FINDINGS-REPORTS\Individual-Reports",
        "$VaultRoot\05-FINDINGS-REPORTS\Summary-Reports",
        "$VaultRoot\05-FINDINGS-REPORTS\Executive-Summaries",
        
        # Subfolder: Remediation
        "$VaultRoot\06-REMEDIATION-TRACKING\Action-Plans",
        "$VaultRoot\06-REMEDIATION-TRACKING\Follow-Up",
        "$VaultRoot\06-REMEDIATION-TRACKING\Completion-Verification",
        
        # Subfolder: Citations
        "$VaultRoot\07-CITATIONS-BIBLIOGRAPHY\Legal-Citations",
        "$VaultRoot\07-CITATIONS-BIBLIOGRAPHY\Research-Sources",
        "$VaultRoot\07-CITATIONS-BIBLIOGRAPHY\Bibliography",
        
        # Subfolder: Visual Assets
        "$VaultRoot\08-VISUAL-ASSETS\Charts",
        "$VaultRoot\08-VISUAL-ASSETS\Diagrams",
        "$VaultRoot\08-VISUAL-ASSETS\Flowcharts",
        "$VaultRoot\08-VISUAL-ASSETS\Org-Charts",
        
        # Technical folders
        "$VaultRoot\.obsidian\plugins",
        "$VaultRoot\.obsidian\themes",
        "$VaultRoot\Scripts",
        "$VaultRoot\.vscode"
    )
    
    foreach ($folder in $folders) {
        if (-not (Test-Path $folder)) {
            New-Item -ItemType Directory -Path $folder -Force | Out-Null
            Write-Host "  ✓ Created: $($folder.Replace($VaultRoot, ''))" -ForegroundColor Green
        }
    }
    
    # Create Obsidian config
    Write-Host "`n[2/8] Configuring Obsidian settings..." -ForegroundColor Yellow
    
    $obsidianConfig = @{
        "pluginEnabledStatus" = @{
            "dataview" = $true
            "templater-obsidian" = $true
            "obsidian-excalidraw-plugin" = $true
            "obsidian-kanban" = $true
            "obsidian-mermaid" = $true
            "calendar" = $true
            "obsidian-charts" = $true
            "table-editor-obsidian" = $true
        }
        "theme" = "obsidian"
        "cssTheme" = "Blue Topaz"
    } | ConvertTo-Json -Depth 10
    
    $configPath = "$VaultRoot\.obsidian"
    if (-not (Test-Path $configPath)) {
        New-Item -ItemType Directory -Path $configPath -Force | Out-Null
    }
    
    Set-Content -Path "$configPath\community-plugins.json" -Value '["dataview","templater-obsidian","obsidian-excalidraw-plugin","obsidian-kanban","calendar","obsidian-charts","table-editor-obsidian"]'
    Write-Host "  ✓ Enabled community plugins" -ForegroundColor Green
    
    # Create plugin installation guide
    Write-Host "`n[3/8] Creating plugin installation guide..." -ForegroundColor Yellow
    
    $pluginGuide = @"
# 🔌 Required Obsidian Plugins - Installation Guide

**Status:** $($Colors.InProgress) Configuration Required

---

## Core Plugins (Install These First)

### 1. Dataview ⭐ CRITICAL
**Purpose:** Dynamic queries and data aggregation
**Use Case:** Automatically track audit progress, missing documents, compliance status

**Installation:**
1. Settings → Community Plugins → Browse
2. Search: "Dataview"
3. Install + Enable

**Configuration:**
- Enable JavaScript queries: ✅
- Enable inline queries: ✅

---

### 2. Templater ⭐ CRITICAL  
**Purpose:** Advanced template system
**Use Case:** Generate audit reports, employee file checklists, policy templates

**Installation:**
1. Settings → Community Plugins → Browse
2. Search: "Templater"
3. Install + Enable

**Configuration:**
- Template folder: ``09-TEMPLATES``
- Enable folder templates: ✅

---

### 3. Excalidraw ⭐ CRITICAL (Visual Support)
**Purpose:** Hand-drawn diagrams and flowcharts
**Use Case:** Create visual audit workflows, org charts, process diagrams

**Installation:**
1. Settings → Community Plugins → Browse
2. Search: "Excalidraw"
3. Install + Enable

**Configuration:**
- Folder: ``08-VISUAL-ASSETS/Diagrams``
- Autosave: ✅

---

### 4. Kanban ⭐ IMPORTANT
**Purpose:** Visual project boards
**Use Case:** Track 47 employee audits, remediation tasks, policy implementation

**Installation:**
1. Settings → Community Plugins → Browse
2. Search: "Kanban"
3. Install + Enable

---

### 5. Charts ⭐ IMPORTANT (Visual Support)
**Purpose:** Create charts and graphs from data
**Use Case:** Compliance dashboards, audit progress visualization

**Installation:**
1. Settings → Community Plugins → Browse
2. Search: "Obsidian Charts"
3. Install + Enable

---

### 6. Calendar 🟢 OPTIONAL
**Purpose:** Calendar view of notes
**Use Case:** Track audit milestones, training deadlines, policy review dates

---

### 7. Table Editor 🟢 OPTIONAL
**Purpose:** Enhanced table editing
**Use Case:** Employee rosters, policy checklists, findings summaries

---

## Installation Checklist

\`\`\`dataview
TABLE WITHOUT ID
  Plugin,
  Status,
  Priority
FROM "09-TEMPLATES"
WHERE contains(file.name, "Plugin")
\`\`\`

- [ ] Dataview installed and enabled
- [ ] Templater installed and enabled
- [ ] Excalidraw installed and enabled
- [ ] Kanban installed and enabled
- [ ] Charts plugin installed
- [ ] Calendar plugin installed (optional)
- [ ] Table Editor installed (optional)

---

## Next Steps After Installation

1. Open [[00-MASTER-DASHBOARD]] to see plugins in action
2. Review [[Visual-Elements-Guide]] for chart/diagram examples
3. Test with [[TEMPLATE-Employee-Audit]] to generate first report

---

**Installation Time:** 10-15 minutes  
**Last Updated:** $(Get-Date -Format "yyyy-MM-dd")
"@
    
    Set-Content -Path "$VaultRoot\Plugin-Installation-Guide.md" -Value $pluginGuide -Encoding UTF8
    Write-Host "  ✓ Created plugin installation guide" -ForegroundColor Green
    
    Write-Host "`n✅ Module 1 Complete: Foundation established" -ForegroundColor Green
}

# Main execution
Write-Host @"
╔══════════════════════════════════════════════════════════════╗
║                                                              ║
║     HR AUDIT VAULT - ENHANCED DEPLOYMENT SYSTEM              ║
║     Version 2.0 - Modular Installation                       ║
║                                                              ║
╚══════════════════════════════════════════════════════════════╝
"@ -ForegroundColor Cyan

Write-Host "`nAvailable Modules:" -ForegroundColor Yellow
Write-Host "  1. Foundation & Plugin Configuration" -ForegroundColor White
Write-Host "  2. Visual Dashboard System" -ForegroundColor White
Write-Host "  3. Document Indexing & Registry" -ForegroundColor White
Write-Host "  4. Policy Management System" -ForegroundColor White
Write-Host "  5. Citation & Bibliography Library" -ForegroundColor White
Write-Host "  6. Auditor's Complete Toolkit" -ForegroundColor White

if ($All) {
    Write-Host "`n🚀 Installing ALL modules..." -ForegroundColor Green
    $Module1 = $Module2 = $Module3 = $Module4 = $Module5 = $Module6 = $true
}

if (-not ($Module1 -or $Module2 -or $Module3 -or $Module4 -or $Module5 -or $Module6)) {
    Write-Host "`n⚠️  No modules selected!" -ForegroundColor Yellow
    Write-Host "Usage: .\Deploy-EnhancedVault.ps1 -All" -ForegroundColor Cyan
    Write-Host "   OR: .\Deploy-EnhancedVault.ps1 -Module1 -Module2" -ForegroundColor Cyan
    exit
}

# Execute selected modules
if ($Module1) { Deploy-Module1-Foundation }

# Placeholder for remaining modules
if ($Module2) { Write-Host "`n⏳ Module 2 will be deployed next..." -ForegroundColor Yellow }
if ($Module3) { Write-Host "`n⏳ Module 3 will be deployed next..." -ForegroundColor Yellow }
if ($Module4) { Write-Host "`n⏳ Module 4 will be deployed next..." -ForegroundColor Yellow }
if ($Module5) { Write-Host "`n⏳ Module 5 will be deployed next..." -ForegroundColor Yellow }
if ($Module6) { Write-Host "`n⏳ Module 6 will be deployed next..." -ForegroundColor Yellow }

Write-Host "`n╔══════════════════════════════════════════════════════════════╗" -ForegroundColor Green
Write-Host "║  DEPLOYMENT COMPLETE                                         ║" -ForegroundColor Green
Write-Host "╚══════════════════════════════════════════════════════════════╝`n" -ForegroundColor Green

Write-Host "📂 Vault Location: $VaultRoot" -ForegroundColor Cyan
Write-Host "`n🎯 Next Steps:" -ForegroundColor Yellow
Write-Host "  1. Open Obsidian → Open folder as vault → Select: $VaultRoot" -ForegroundColor White
Write-Host "  2. Follow: Plugin-Installation-Guide.md" -ForegroundColor White
Write-Host "  3. Run next module deployment" -ForegroundColor White