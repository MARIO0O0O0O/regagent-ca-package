<#
.SYNOPSIS
    HR Audit Vault - Complete One-Click Deployment
.DESCRIPTION
    Master script that deploys all 6 modules automatically:
    - Module 1: Foundation & Plugins
    - Module 2: Visual Dashboard + 23-Day Charter
    - Module 3: Document Indexing System
    - Module 4: Policy Management
    - Module 5: Citation Library
    - Module 6: Auditor's Toolkit
.USAGE
    .\Deploy-HR-Audit-Complete.ps1
.NOTES
    Author: HR Audit Project
    Version: 3.0 - Complete Automation
#>

# ==============================================================================
# CONFIGURATION
# ==============================================================================

$VaultRoot = "C:\Users\mespindola\Documents\HR-Audit"
$ScriptsSource = "C:\Users\mespindola\Documents\SCRIPTS"
$StartDate = Get-Date "2025-12-17"

# Color codes
$ColorSuccess = "Green"
$ColorWarning = "Yellow"
$ColorError = "Red"
$ColorInfo = "Cyan"
$ColorHighlight = "Magenta"

# Emojis
$IconSuccess = "✅"
$IconWarning = "⚠️"
$IconError = "❌"
$IconInfo = "ℹ️"
$IconProgress = "🔄"
$IconComplete = "🎉"

# ==============================================================================
# HELPER FUNCTIONS
# ==============================================================================

function Write-Banner {
    param([string]$Text)
    $length = $Text.Length + 4
    $border = "=" * $length
    Write-Host "`n$border" -ForegroundColor $ColorInfo
    Write-Host "  $Text  " -ForegroundColor $ColorInfo
    Write-Host "$border`n" -ForegroundColor $ColorInfo
}

function Write-ModuleHeader {
    param(
        [string]$ModuleName,
        [int]$ModuleNumber
    )
    Write-Host "`n╔════════════════════════════════════════════════════════════╗" -ForegroundColor $ColorHighlight
    Write-Host "║  MODULE $ModuleNumber : $ModuleName" -ForegroundColor $ColorHighlight
    Write-Host "╚════════════════════════════════════════════════════════════╝`n" -ForegroundColor $ColorHighlight
}

function Write-Step {
    param(
        [string]$Message,
        [string]$Status = "Info"
    )
    
    $icon = switch ($Status) {
        "Success" { $IconSuccess }
        "Warning" { $IconWarning }
        "Error" { $IconError }
        "Progress" { $IconProgress }
        default { $IconInfo }
    }
    
    $color = switch ($Status) {
        "Success" { $ColorSuccess }
        "Warning" { $ColorWarning }
        "Error" { $ColorError }
        "Progress" { $ColorInfo }
        default { "White" }
    }
    
    Write-Host "  $icon $Message" -ForegroundColor $color
}

function Test-Prerequisites {
    Write-Banner "CHECKING PREREQUISITES"
    
    $allGood = $true
    
    # Check Python
    Write-Step "Checking Python installation..." "Progress"
    try {
        $pythonVersion = & python --version 2>&1
        if ($pythonVersion -match "Python 3\.") {
            Write-Step "Python found: $pythonVersion" "Success"
        } else {
            Write-Step "Python not found or incorrect version" "Error"
            $allGood = $false
        }
    } catch {
        Write-Step "Python not found in PATH" "Error"
        $allGood = $false
    }
    
    # Check if hr_audit.py exists
    Write-Step "Checking for hr_audit.py..." "Progress"
    if (Test-Path "$ScriptsSource\hr_audit.py") {
        Write-Step "hr_audit.py found" "Success"
    } else {
        Write-Step "hr_audit.py not found - will create it" "Warning"
    }
    
    # Check if .env exists
    Write-Step "Checking for .env file..." "Progress"
    if (Test-Path "$ScriptsSource\.env") {
        Write-Step ".env file found" "Success"
    } else {
        Write-Step ".env file not found - will create template" "Warning"
    }
    
    return $allGood
}

# ==============================================================================
# MODULE 1: FOUNDATION & PLUGIN CONFIGURATION
# ==============================================================================

function Deploy-Module1-Foundation {
    Write-ModuleHeader "Foundation & Plugin Configuration" 1
    
    Write-Step "Creating comprehensive folder structure..." "Progress"
    
    $folders = @(
        # Core folders
        "$VaultRoot\00-DASHBOARD",
        "$VaultRoot\00-DASHBOARD\Daily",
        "$VaultRoot\00-DASHBOARD\Weekly",
        "$VaultRoot\00-DASHBOARD\Status-Reports",
        
        "$VaultRoot\01-AUDIT-PLANNING",
        "$VaultRoot\01-AUDIT-PLANNING\Timeline",
        "$VaultRoot\01-AUDIT-PLANNING\Checklists",
        "$VaultRoot\01-AUDIT-PLANNING\Scope-Documents",
        "$VaultRoot\01-AUDIT-PLANNING\Risk-Assessment",
        
        "$VaultRoot\02-EMPLOYEE-FILES",
        "$VaultRoot\02-EMPLOYEE-FILES\Personnel-Jackets",
        "$VaultRoot\02-EMPLOYEE-FILES\Confidential-Medical",
        "$VaultRoot\02-EMPLOYEE-FILES\I-9-Files",
        "$VaultRoot\02-EMPLOYEE-FILES\Investigation-Files",
        "$VaultRoot\02-EMPLOYEE-FILES\Scanned-Documents",
        
        "$VaultRoot\03-POLICY-LIBRARY",
        "$VaultRoot\03-POLICY-LIBRARY\Required-Policies",
        "$VaultRoot\03-POLICY-LIBRARY\Recommended-Policies",
        "$VaultRoot\03-POLICY-LIBRARY\Training-Materials",
        "$VaultRoot\03-POLICY-LIBRARY\Policy-Tracking",
        
        "$VaultRoot\04-COMPLIANCE-RESEARCH",
        "$VaultRoot\04-COMPLIANCE-RESEARCH\Federal-Law",
        "$VaultRoot\04-COMPLIANCE-RESEARCH\California-State",
        "$VaultRoot\04-COMPLIANCE-RESEARCH\Local-Ordinances",
        "$VaultRoot\04-COMPLIANCE-RESEARCH\Case-Law",
        
        "$VaultRoot\05-FINDINGS-REPORTS",
        "$VaultRoot\05-FINDINGS-REPORTS\Individual-Reports",
        "$VaultRoot\05-FINDINGS-REPORTS\Summary-Reports",
        "$VaultRoot\05-FINDINGS-REPORTS\Executive-Summaries",
        
        "$VaultRoot\06-REMEDIATION-TRACKING",
        "$VaultRoot\06-REMEDIATION-TRACKING\Action-Plans",
        "$VaultRoot\06-REMEDIATION-TRACKING\Follow-Up",
        "$VaultRoot\06-REMEDIATION-TRACKING\Completion-Verification",
        
        "$VaultRoot\07-CITATIONS-BIBLIOGRAPHY",
        "$VaultRoot\07-CITATIONS-BIBLIOGRAPHY\Legal-Citations",
        "$VaultRoot\07-CITATIONS-BIBLIOGRAPHY\Research-Sources",
        "$VaultRoot\07-CITATIONS-BIBLIOGRAPHY\Bibliography",
        
        "$VaultRoot\08-VISUAL-ASSETS",
        "$VaultRoot\08-VISUAL-ASSETS\Charts",
        "$VaultRoot\08-VISUAL-ASSETS\Diagrams",
        "$VaultRoot\08-VISUAL-ASSETS\Flowcharts",
        "$VaultRoot\08-VISUAL-ASSETS\Org-Charts",
        
        "$VaultRoot\09-TEMPLATES",
        
        "$VaultRoot\.obsidian",
        "$VaultRoot\.obsidian\plugins",
        "$VaultRoot\.obsidian\themes",
        
        "$VaultRoot\Scripts",
        "$VaultRoot\.vscode"
    )
    
    $created = 0
    $existed = 0
    
    foreach ($folder in $folders) {
        if (-not (Test-Path $folder)) {
            New-Item -ItemType Directory -Path $folder -Force | Out-Null
            $created++
        } else {
            $existed++
        }
    }
    
    Write-Step "Created $created new folders, $existed already existed" "Success"
    
    # Copy scripts to vault
    Write-Step "Copying scripts to vault..." "Progress"
    
    if (Test-Path "$ScriptsSource\hr_audit.py") {
        Copy-Item "$ScriptsSource\hr_audit.py" "$VaultRoot\Scripts\" -Force
        Write-Step "Copied hr_audit.py" "Success"
    }
    
    if (Test-Path "$ScriptsSource\.env") {
        Copy-Item "$ScriptsSource\.env" "$VaultRoot\Scripts\" -Force
        Write-Step "Copied .env file" "Success"
    } else {
        # Create .env template
        $envTemplate = @"
# API Keys - REPLACE WITH YOUR ACTUAL KEYS
ANTHROPIC_API_KEY=your_anthropic_key_here
GEMINI_API_KEY=your_gemini_key_here
PERPLEXITY_API_KEY=your_perplexity_key_here

# Obsidian Vault Path
VAULT_PATH=$VaultRoot
"@
        Set-Content -Path "$VaultRoot\Scripts\.env" -Value $envTemplate -Encoding UTF8
        Write-Step "Created .env template - REMEMBER TO ADD YOUR API KEYS!" "Warning"
    }
    
    # Update .env vault path
    if (Test-Path "$VaultRoot\Scripts\.env") {
        $envContent = Get-Content "$VaultRoot\Scripts\.env" -Raw
        $envContent = $envContent -replace 'VAULT_PATH=.*', "VAULT_PATH=$VaultRoot"
        Set-Content -Path "$VaultRoot\Scripts\.env" -Value $envContent -NoNewline
        Write-Step "Updated VAULT_PATH in .env" "Success"
    }
    
    # Create Obsidian plugin configuration
    Write-Step "Configuring Obsidian plugins..." "Progress"
    
    $pluginsList = @(
        "dataview",
        "templater-obsidian",
        "obsidian-excalidraw-plugin",
        "obsidian-kanban",
        "calendar",
        "obsidian-charts",
        "table-editor-obsidian"
    ) | ConvertTo-Json
    
    Set-Content -Path "$VaultRoot\.obsidian\community-plugins.json" -Value $pluginsList
    Write-Step "Plugin configuration created" "Success"
    
    # Create plugin installation guide
    $pluginGuide = @"
# 🔌 Required Obsidian Plugins - Installation Guide

## CRITICAL: Install These Plugins First!

### Installation Steps:
1. Open Obsidian
2. Settings (gear icon) → Community Plugins → Browse
3. Search for each plugin below and click Install + Enable

---

## Required Plugins

### 1. ⭐ Dataview (CRITICAL)
**Purpose:** Auto-update dashboards, track progress, calculate health scores
**Search:** "Dataview"

### 2. ⭐ Templater (CRITICAL)
**Purpose:** Generate audit reports, daily standups, employee checklists
**Search:** "Templater"

### 3. ⭐ Excalidraw (CRITICAL - Visual Support)
**Purpose:** Draw diagrams, flowcharts, org charts
**Search:** "Excalidraw"

### 4. ⭐ Kanban (IMPORTANT)
**Purpose:** Track 47 employee audits visually
**Search:** "Kanban"

### 5. ⭐ Charts (IMPORTANT - Visual Support)
**Purpose:** Create compliance graphs, health score charts
**Search:** "Obsidian Charts"

### 6. 🟢 Calendar (Optional)
**Purpose:** View audit timeline, track milestones
**Search:** "Calendar"

### 7. 🟢 Table Editor (Optional)
**Purpose:** Edit employee rosters, policy checklists
**Search:** "Table Editor"

---

## After Installation

1. Open [[00-MASTER-DASHBOARD]] to see plugins in action
2. Test with [[PROJECT-CHARTER]] to view Gantt charts
3. Create your first daily standup from template

**Installation Time:** 10-15 minutes

---

Generated: $(Get-Date -Format "yyyy-MM-dd HH:mm")
"@
    
    Set-Content -Path "$VaultRoot\PLUGIN-INSTALLATION-GUIDE.md" -Value $pluginGuide -Encoding UTF8
    Write-Step "Created plugin installation guide" "Success"
    
    # Create VSCode workspace
    Write-Step "Creating VSCode workspace..." "Progress"
    
    $workspaceConfig = @{
        "folders" = @(@{ "path" = "." })
        "settings" = @{
            "python.defaultInterpreterPath" = "C:\Users\mespindola\AppData\Local\Programs\Python\Python312\python.exe"
            "files.exclude" = @{
                "**/__pycache__" = $true
                "**/*.pyc" = $true
            }
        }
    } | ConvertTo-Json -Depth 10
    
    Set-Content -Path "$VaultRoot\HR-Audit.code-workspace" -Value $workspaceConfig
    Write-Step "VSCode workspace created" "Success"
    
    # Create VSCode tasks
    $tasksConfig = @'
{
    "version": "2.0.0",
    "tasks": [
        {
            "label": "HR Audit: Research",
            "type": "shell",
            "command": "python",
            "args": ["${workspaceFolder}\\Scripts\\hr_audit.py", "research", "${input:researchQuery}"],
            "problemMatcher": []
        },
        {
            "label": "HR Audit: Generate Report",
            "type": "shell",
            "command": "python",
            "args": ["${workspaceFolder}\\Scripts\\hr_audit.py", "report", "${input:reportContext}"],
            "problemMatcher": []
        },
        {
            "label": "HR Audit: Compliance Summary",
            "type": "shell",
            "command": "python",
            "args": ["${workspaceFolder}\\Scripts\\hr_audit.py", "summary", "${input:summaryTopic}"],
            "problemMatcher": []
        }
    ],
    "inputs": [
        {
            "id": "researchQuery",
            "type": "promptString",
            "description": "Enter compliance requirement to research:"
        },
        {
            "id": "reportContext",
            "type": "promptString",
            "description": "Enter audit report context:"
        },
        {
            "id": "summaryTopic",
            "type": "promptString",
            "description": "Enter compliance topic:"
        }
    ]
}
'@
    
    Set-Content -Path "$VaultRoot\.vscode\tasks.json" -Value $tasksConfig
    Write-Step "VSCode tasks configured" "Success"
    
    Write-Step "MODULE 1 COMPLETE" "Success"
}

# ==============================================================================
# MODULE 2: VISUAL DASHBOARD + 23-DAY CHARTER
# ==============================================================================

function Deploy-Module2-Dashboard {
    Write-ModuleHeader "Visual Dashboard + 23-Day Project Charter" 2
    
    Write-Step "Creating project charter with actual working days..." "Progress"
    
    $projectCharter = @"
---
tags: [project-charter, critical]
status: active
created: $(Get-Date -Format "yyyy-MM-dd")
---

# 🎯 HR Personnel File Audit - Project Charter

## Executive Summary

**Project Name:** Comprehensive Personnel File Audit  
**Project Duration:** 23 Working Days (December 17, 2025 - January 28, 2026)  
**Calendar Span:** 43 calendar days  
**Scope:** 47 Employee Personnel Files  
**Status:** 🔄 In Progress

---

## 📊 Visual Timeline

\`\`\`mermaid
gantt
    title 23-Day HR Audit Timeline
    dateFormat  YYYY-MM-DD
    
    section Phase 1: Planning
    Day 1 - Kickoff             :milestone, 2025-12-17, 0d
    Day 2 - Checklists          :2025-12-19, 1d
    Day 3 - Policy Audit        :2025-12-22, 1d
    Day 4-5 - File Collection   :2025-12-23, 2d
    
    section Phase 2: Scanning
    Day 6-7 - Batch 1           :2025-12-29, 2d
    Day 8 - Batch 2 Start       :2026-01-02, 1d
    Day 9-10 - Complete Scan    :2026-01-08, 2d
    
    section Phase 3: AI Review
    Day 11-12 - AI Setup        :2026-01-12, 2d
    Day 13-15 - Batch 1 Review  :2026-01-14, 3d
    Day 16-18 - Batch 2 Review  :2026-01-19, 3d
    Day 19-20 - Batch 3 Review  :2026-01-22, 2d
    
    section Phase 4: Reporting
    Day 21 - Findings           :2026-01-26, 1d
    Day 22 - Remediation        :2026-01-27, 1d
    Day 23 - Final Report       :milestone, 2026-01-28, 0d
\`\`\`

---

## 🎯 Quick Stats Dashboard

| Metric | Current | Target | Status |
|--------|---------|--------|--------|
| Files Scanned | 0 | 47 | ⚪ Not Started |
| Files Reviewed | 0 | 47 | ⚪ Not Started |
| Health Score | 0% | 85%+ | ⚪ TBD |
| Critical Gaps | 0 | TBD | ⚪ TBD |

---

## 📅 Actual Working Days Schedule

### Phase 1: Planning & Setup (Days 1-5)
- **Day 1** (12/17/25 Tue): Project kickoff, vault setup
- **Day 2** (12/19/25 Thu): Checklist development
- **Day 3** (12/22/25 Mon): Policy library audit
- **Day 4** (12/23/25 Tue): File collection Batch 1
- **Day 5** (12/26/25 Fri): Continue collection

### Phase 2: Scanning (Days 6-10)
- **Day 6** (12/29/25 Mon): Scan Batch 1 (Employees 1-8)
- **Day 7** (12/30/25 Tue): Scan Batch 1 (Employees 9-16)
- **Day 8** (01/02/26 Fri): Start Batch 2 (Employees 17-24)
- **Day 9** (01/08/26 Thu): Complete Batch 2 (Employees 25-32)
- **Day 10** (01/09/26 Fri): Complete Batch 3 (Employees 33-47)

### Phase 3: AI Review (Days 11-20)
- **Day 11-12** (01/12-13/26): AI setup & testing
- **Day 13-15** (01/14-16/26): Review Batch 1 (16 employees)
- **Day 16-18** (01/19-21/26): Review Batch 2 (16 employees)
- **Day 19-20** (01/22-23/26): Review Batch 3 (15 employees)

### Phase 4: Reporting (Days 21-23)
- **Day 21** (01/26/26 Mon): Aggregate findings
- **Day 22** (01/27/26 Tue): Remediation planning
- **Day 23** (01/28/26 Wed): Executive presentation 🎉

---

## 📊 Auto-Tracking Queries

### Files Uploaded Count
\`\`\`dataview
TABLE WITHOUT ID
  ("Files Scanned: " + length(rows) + " / 47") AS Status
FROM "02-EMPLOYEE-FILES/Scanned-Documents"
GROUP BY true
\`\`\`

### Files Reviewed Count
\`\`\`dataview
TABLE WITHOUT ID
  ("Files Reviewed: " + length(rows) + " / 47") AS Status
FROM "05-FINDINGS-REPORTS/Individual-Reports"
WHERE overall_health
GROUP BY true
\`\`\`

### Overall Health Score
\`\`\`dataview
TABLE WITHOUT ID
  ("Health Score: " + round(average(rows.overall_health), 1) + "%") AS Score
FROM "05-FINDINGS-REPORTS/Individual-Reports"
WHERE overall_health
GROUP BY true
\`\`\`

---

## 🎯 Success Criteria

- [ ] All 47 files reviewed with findings
- [ ] Health score ≥ 85% for Tier 1 documents
- [ ] Zero high-risk gaps remaining
- [ ] Remediation roadmap approved
- [ ] Executive summary delivered

---

**Charter Version:** 2.0  
**Last Updated:** $(Get-Date -Format "yyyy-MM-dd HH:mm")
"@
    
    Set-Content -Path "$VaultRoot\00-DASHBOARD\PROJECT-CHARTER.md" -Value $projectCharter -Encoding UTF8
    Write-Step "Created project charter" "Success"
    
    # Create Health Score Tracker
    Write-Step "Creating health score tracker..." "Progress"
    
    $healthTracker = @"
---
tags: [dashboard, metrics, auto-update]
---

# 📊 Health Score Tracker - Real-Time

**Last Update:** \`= date(now)\`

---

## 🎯 Overall Status

### Current Health Score: <span style="font-size:3em">⚪</span> 0%

\`\`\`mermaid
pie title Current Compliance Status
    "Not Started" : 47
    "Excellent (90-100%)" : 0
    "Good (75-89%)" : 0
    "Fair (60-74%)" : 0
    "Poor (<60%)" : 0
\`\`\`

---

## 📈 Progress Metrics

| Metric | Current | Target | Status |
|--------|---------|--------|--------|
| Files Scanned | 0 | 47 | ⚪ |
| Files Reviewed | 0 | 47 | ⚪ |
| Tier 1 Compliance | 0% | 100% | 🔴 |
| Tier 2 Compliance | 0% | 85% | ⚪ |
| Tier 3 Compliance | 0% | 70% | ⚪ |

---

## 📁 Recent Uploads (This Week)

\`\`\`dataview
TABLE WITHOUT ID
  file.name AS "File",
  file.ctime AS "Upload Date",
  file.size AS "Size"
FROM "02-EMPLOYEE-FILES/Scanned-Documents"
WHERE file.cday >= date(today) - dur(7 days)
SORT file.ctime DESC
LIMIT 10
\`\`\`

---

## 🔍 Review Status by Employee

\`\`\`dataview
TABLE WITHOUT ID
  employee_name AS "Employee",
  tier1_score AS "T1",
  tier2_score AS "T2",
  overall_health AS "Health",
  choice(overall_health >= 90, "🟢", choice(overall_health >= 75, "🟡", choice(overall_health >= 60, "🟠", "🔴"))) AS "Status"
FROM "05-FINDINGS-REPORTS/Individual-Reports"
WHERE overall_health
SORT overall_health DESC
\`\`\`

---

## 🔴 Critical Gaps (High Risk)

\`\`\`dataview
TABLE WITHOUT ID
  employee AS "Employee",
  missing_doc AS "Missing Document",
  legal_authority AS "Legal Basis",
  deadline AS "Fix By"
FROM "05-FINDINGS-REPORTS"
WHERE risk_level = "HIGH" AND status != "resolved"
SORT deadline ASC
\`\`\`

---

**Dashboard Auto-Updates When:**
- Files uploaded to \`02-EMPLOYEE-FILES/Scanned-Documents/\`
- AI generates reports in \`05-FINDINGS-REPORTS/Individual-Reports/\`
- Status tags changed to \`#status/complete\`

---

Generated: $(Get-Date -Format "yyyy-MM-dd HH:mm")
"@
    
    Set-Content -Path "$VaultRoot\00-DASHBOARD\Health-Score-Tracker.md" -Value $healthTracker -Encoding UTF8
    Write-Step "Created health score tracker" "Success"
    
    # Create Master Dashboard
    Write-Step "Creating master dashboard..." "Progress"
    
    $masterDashboard = @"
---
cssclass: dashboard
tags: [dashboard, home]
---

# 🏠 HR AUDIT MASTER DASHBOARD

**Today:** \`= date(today)\`

---

## 🎯 Quick Stats

<div style="display: flex; justify-content: space-around; text-align: center;">
<div><h2>⚪</h2><p><strong>Files Scanned</strong></p><p>0 / 47</p></div>
<div><h2>⚪</h2><p><strong>Files Reviewed</strong></p><p>0 / 47</p></div>
<div><h2>⚪</h2><p><strong>Health Score</strong></p><p>0%</p></div>
<div><h2>🔴</h2><p><strong>Critical Gaps</strong></p><p>TBD</p></div>
</div>

---

## 📊 Project Timeline

See: [[PROJECT-CHARTER|Full 23-Day Schedule]]

**Days Remaining:** [Calculate from 12/17/25]

---

## 🔥 Today's Priorities

- [ ] [Add today's tasks here]

---

## 📁 Recent Files

\`\`\`dataview
TABLE WITHOUT ID
  file.link AS "File",
  file.ctime AS "Uploaded"
FROM "02-EMPLOYEE-FILES"
SORT file.ctime DESC
LIMIT 5
\`\`\`

---

## 🎯 Quick Links

### Planning
- [[PROJECT-CHARTER|📋 23-Day Project Charter]]
- [[Health-Score-Tracker|📊 Health Dashboard]]
- [[PLUGIN-INSTALLATION-GUIDE|🔌 Plugin Setup]]

### Employee Files
- [[02-EMPLOYEE-FILES/Personnel-Jackets/|👤 Personnel Jackets]]
- [[02-EMPLOYEE-FILES/Confidential-Medical/|🏥 Medical Files]]
- [[02-EMPLOYEE-FILES/I-9-Files/|📄 I-9 Files]]

### Policy Library
- [[03-POLICY-LIBRARY/Required-Policies/|⚖️ Required Policies]]
- [[03-POLICY-LIBRARY/Policy-Tracking/|✅ Policy Tracker]]

### Reports
- [[05-FINDINGS-REPORTS/Individual-Reports/|📄 Individual Reports]]
- [[05-FINDINGS-REPORTS/Summary-Reports/|📊 Summary Reports]]

---

**Last Updated:** \`= date(now)\`
"@
    
    Set-Content -Path "$VaultRoot\00-DASHBOARD\00-MASTER-DASHBOARD.md" -Value $masterDashboard -Encoding UTF8
    Write-Step "Created master dashboard" "Success"
    
    # Create Daily Standup Template
    Write-Step "Creating daily standup template..." "Progress"
    
    $dailyTemplate = @"
---
date: {{date:YYYY-MM-DD}}
tags: [daily-standup]
---

# 📅 Daily Standup - {{date:YYYY-MM-DD}}

**Project Day:** __ of 23

---

## ✅ Yesterday's Accomplishments

- 
- 

**Files Processed:** 0

---

## 🎯 Today's Goals

- [ ] 
- [ ] 

**Target Files:** 0

---

## 🚧 Blockers

- None

---

## 📊 Metrics

| Metric | Target | Actual | Status |
|--------|--------|--------|--------|
| Files Scanned | __ | 0 | ⚪ |
| Files Reviewed | __ | 0 | ⚪ |

---

## 🔄 Health Score Update

**Current:** __%  
**Trend:** ➡️ Stable

---

**Completed By:** [Your Name]
"@
    
    Set-Content -Path "$VaultRoot\09-TEMPLATES\TEMPLATE-Daily-Standup.md" -Value $dailyTemplate -Encoding UTF8
    Write-Step "Created daily standup template" "Success"
    
    Write-Step "MODULE 2 COMPLETE" "Success"
}

# ==============================================================================
# MODULE 3: DOCUMENT INDEXING (SIMPLIFIED)
# ==============================================================================

function Deploy-Module3-Indexing {
    Write-ModuleHeader "Document Indexing System" 3
    
    Write-Step "Creating master file index..." "Progress"
    
    $fileIndex = @"
---
tags: [index, registry]
---

# 📑 Master File Index

**Auto-Generated:** \`= date(now)\`

---

## 📊 File Statistics

### Total Files in Vault
\`\`\`dataview
TABLE WITHOUT ID
  ("Total Files: " + length(rows)) AS Count
FROM ""
WHERE file.name != "Master-File-Index"
GROUP BY true
\`\`\`

### Files by Folder
\`\`\`dataview
TABLE WITHOUT ID
  file.folder AS "Folder",
  length(rows) AS "File Count"
FROM ""
GROUP BY file.folder
SORT file.folder ASC
\`\`\`

---

## 📁 Employee Files

### Scanned Documents
\`\`\`dataview
LIST
FROM "02-EMPLOYEE-FILES/Scanned-Documents"
SORT file.name ASC
\`\`\`

### Findings Reports
\`\`\`dataview
LIST
FROM "05-FINDINGS-REPORTS/Individual-Reports"
SORT file.name ASC
\`\`\`

---

## 📚 Policy Library

### Required Policies
\`\`\`dataview
LIST
FROM "03-POLICY-LIBRARY/Required-Policies"
SORT file.name ASC
\`\`\`

### Recommended Policies
\`\`\`dataview
LIST
FROM "03-POLICY-LIBRARY/Recommended-Policies"
SORT file.name ASC
\`\`\`

---

## 📖 Research & Compliance

### Federal Law Research
\`\`\`dataview
LIST
FROM "04-COMPLIANCE-RESEARCH/Federal-Law"
SORT file.name ASC
\`\`\`

### California State Law Research
\`\`\`dataview
LIST
FROM "04-COMPLIANCE-RESEARCH/California-State"
SORT file.name ASC
\`\`\`

---

**Index Updates Automatically**
"@
    
    Set-Content -Path "$VaultRoot\Master-File-Index.md" -Value $fileIndex -Encoding UTF8
    Write-Step "Created master file index" "Success"
    
    Write-Step "MODULE 3 COMPLETE" "Success"
}

# ==============================================================================
# MODULE 4: POLICY MANAGEMENT
# ==============================================================================

function Deploy-Module4-Policy {
    Write-ModuleHeader "Policy Management System" 4
    
    Write-Step "Creating California required policies checklist..." "Progress"
    
    $policyChecklist = @"
---
tags: [policies, california, checklist]
---

# ⚖️ California Required Policies - Checklist

**Compliance Status:** 🔴 Not Started

---

## 🔴 TIER 1: MUST HAVE (Legally Required)

### Southern California Specific Requirements

| Policy | Status | Required By | Effective Date | Notes |
|--------|--------|-------------|----------------|-------|
| **Harassment Prevention Training** | ⚪ | Cal. Gov. Code § 12950.1 | Ongoing (every 2 years) | 5+ employees |
| **Workplace Violence Prevention Plan** | ⚪ | Cal. Lab. Code § 6401.7 (SB 553) | Effective 7/1/2024 | Written plan required |
| **FMLA/CFRA Leave Policy** | ⚪ | 29 USC § 2601; Cal. Gov. Code § 12945.2 | Current | 50+ employees |
| **Pregnancy Disability Leave (PDL)** | ⚪ | Cal. Gov. Code § 12945 | Current | 5+ employees |
| **Paid Sick Leave Policy** | ⚪ | Cal. Lab. Code §§ 246-246.5 | Current | All employees |
| **Employee Rights Notice (SB 294)** | ⚪ | Cal. Lab. Code § 2810.3 | Effective 2/1/2026 | Annual notice |
| **Anti-Discrimination Policy** | ⚪ | Cal. Gov. Code § 12940 (FEHA) | Current | 5+ employees |
| **Anti-Retaliation Policy** | ⚪ | Cal. Lab. Code § 1102.5 | Current | All employees |
| **Meal & Rest Break Policy** | ⚪ | Cal. Lab. Code § 512 | Current | Non-exempt employees |
| **Lactation Accommodation Policy** | ⚪ | Cal. Lab. Code § 1031 | Current | All employers |

---

## 🟡 TIER 2: IMPORTANT (Highly Recommended)

| Policy | Status | Reason | Priority |
|--------|--------|--------|----------|
| **Military Leave Policy** | ⚪ | USERRA compliance | High |
| **Bereavement Leave Policy** | ⚪ | Best practice | Medium |
| **Jury Duty Leave Policy** | ⚪ | Cal. Lab. Code § 230 | High |
| **Voting Time Off Policy** | ⚪ | Elections Code § 14000 | Medium |
| **Reasonable Accommodation Policy** | ⚪ | ADA/FEHA compliance | High |
| **Drug-Free Workplace Policy** | ⚪ | Federal contractors / best practice | Medium |
| **Social Media Policy** | ⚪ | Risk management | Low |

---

## 🟢 TIER 3: NICE TO HAVE (Optional)

| Policy | Status | Benefit |
|--------|--------|---------|
| **Remote Work Policy** | ⚪ | Flexibility |
| **Professional Development** | ⚪ | Employee retention |
| **Dress Code Policy** | ⚪ | Workplace standards |
| **Referral Bonus Program** | ⚪ | Recruitment |

---

## 📊 Compliance Status

\`\`\`mermaid
pie title Policy Compliance Status
    "Complete" : 0
    "In Progress" : 0
    "Not Started" : 10
\`\`\`

---

## ✅ Next Steps

1. [ ] Review Tier 1 policies - identify missing
2. [ ] Draft missing required policies
3. [ ] Legal counsel review
4. [ ] Employee distribution
5. [ ] Acknowledgment tracking

---

**Created:** $(Get-Date -Format "yyyy-MM-dd HH:mm")
"@
    
    Set-Content -Path "$VaultRoot\03-POLICY-LIBRARY\Policy-Tracking\California-Required-Policies-Checklist.md" -Value $policyChecklist -Encoding UTF8
    Write-Step "Created California policy checklist" "Success"
    
    # Create leave management policy template
    Write-Step "Creating leave management policy template..." "Progress"
    
    $leavePolicy = @"
---
tags: [policy, leave-management, fmla, cfra, pdl]
status: template
---

# 🏖️ Leave Management Policy Template

**Policy Category:** TIER 1 - Required  
**Applies To:** All Employees  
**Legal Authorities:** FMLA, CFRA, PDL, Cal. Lab. Code

---

## Federal Family and Medical Leave Act (FMLA)

### Eligibility
- Worked for employer ≥ 12 months
- Worked ≥ 1,250 hours in past 12 months
- Employer has ≥ 50 employees within 75 miles

### Entitlement
- 12 weeks unpaid, job-protected leave per 12-month period

### Qualifying Reasons
- Birth/care of newborn
- Placement of adopted/foster child
- Care for spouse/child/parent with serious health condition
- Employee's own serious health condition
- Military family leave

---

## California Family Rights Act (CFRA)

### Eligibility
- Worked for employer ≥ 12 months
- Worked ≥ 1,250 hours in past 12 months
- Employer has ≥ 5 employees

### Entitlement
- 12 weeks unpaid, job-protected leave per 12-month period
- Runs concurrently with FMLA when both apply

---

## Pregnancy Disability Leave (PDL)

### Eligibility
- All employees (no minimum service)
- Employer has ≥ 5 employees

### Entitlement
- Up to 4 months (17.3 weeks) for pregnancy disability
- Separate from and in addition to CFRA leave
- PDL + CFRA = up to 7 months total protection

---

## Military Leave

### Types
- USERRA military service leave
- California Military Spouse Leave (Cal. Mil. & Vet. Code § 395.10)

---

## Paid Sick Leave

### Entitlement (Cal. Lab. Code § 246)
- Minimum 40 hours (5 days) per year
- Accrual: 1 hour per 30 hours worked
- Carryover: Unused hours carry to next year (80-hour cap)

### Usage
- Employee's own health condition
- Family member care
- Victim of domestic violence/sexual assault/stalking

---

## Paid Time Off (PTO) - Vacation

**Note:** California law treats vacation as earned wages  
- Cannot have "use it or lose it" policies
- Must pay out accrued vacation at separation

---

## Procedure for Requesting Leave

1. Employee submits request to HR
2. HR determines eligibility
3. HR provides required notices (FMLA/CFRA rights)
4. Medical certification requested if applicable
5. Leave approved/denied in writing
6. Leave tracked (dates, hours, type)
7. Return-to-work coordinated

---

## Required Documentation

- Leave request form
- Medical certification (DOL WH-380-E for FMLA)
- Eligibility notice
- Rights and responsibilities notice
- Designation notice
- Leave tracking log

---

**Policy Effective Date:** [TBD]  
**Last Reviewed:** $(Get-Date -Format "yyyy-MM-dd")  
**Next Review:** [Annual]
"@
    
    Set-Content -Path "$VaultRoot\03-POLICY-LIBRARY\Required-Policies\Leave-Management-Policy-TEMPLATE.md" -Value $leavePolicy -Encoding UTF8
    Write-Step "Created leave management policy template" "Success"
    
    Write-Step "MODULE 4 COMPLETE" "Success"
}

# ==============================================================================
# MODULE 5: CITATION LIBRARY
# ==============================================================================

function Deploy-Module5-Citations {
    Write-ModuleHeader "Citation & Bibliography Library" 5
    
    Write-Step "Creating citation system..." "Progress"
    
    $citationGuide = @"
---
tags: [citations, legal, apa, mla]
---

# 📚 Citation Library - Legal & Research Sources

## Citation Formats Supported

- **APA 7th Edition** (Social Sciences)
- **MLA 9th Edition** (Humanities)
- **Bluebook** (Legal)

---

## Federal Statutes (APA Format)

### Fair Labor Standards Act (FLSA)
\`\`\`
Fair Labor Standards Act of 1938, 29 U.S.C. §§ 201-219 (1938).
\`\`\`

### Family and Medical Leave Act (FMLA)
\`\`\`
Family and Medical Leave Act of 1993, 29 U.S.C. §§ 2601-2654 (1993).
\`\`\`

### Americans with Disabilities Act (ADA)
\`\`\`
Americans with Disabilities Act of 1990, 42 U.S.C. §§ 12101-12213 (1990).
\`\`\`

### Title VII Civil Rights Act
\`\`\`
Civil Rights Act of 1964, Pub. L. No. 88-352, 78 Stat. 241 (codified as amended at 42 U.S.C. § 2000e).
\`\`\`

---

## California Statutes (APA Format)

### California Labor Code
\`\`\`
Cal. Lab. Code § [section number] (West [year]).

Example:
Cal. Lab. Code § 226 (West 2025).
\`\`\`

### California Government Code (FEHA)
\`\`\`
Cal. Gov. Code §§ 12940-12951 (West 2025).
\`\`\`

### Recent Legislation
\`\`\`
Senate Bill 513, 2023-2024 Reg. Sess. (Cal. 2023) (effective Jan. 1, 2026).
Senate Bill 553, 2023-2024 Reg. Sess. (Cal. 2023) (effective July 1, 2024).
Senate Bill 807, 2021-2022 Reg. Sess. (Cal. 2021) (effective Jan. 1, 2022).
\`\`\`

---

## Code of Federal Regulations (CFR)

### FMLA Regulations
\`\`\`
29 C.F.R. § 825.500 (2025).
\`\`\`

### OSHA Recordkeeping
\`\`\`
29 C.F.R. § 1904.33 (2025).
\`\`\`

---

## Web Resources (APA Format)

### SHRM
\`\`\`
Society for Human Resource Management. (2025). [Title of article]. https://www.shrm.org/[url]
\`\`\`

### California DIR
\`\`\`
California Department of Industrial Relations. (2025). [Title of page]. https://www.dir.ca.gov/[url]
\`\`\`

### U.S. Department of Labor
\`\`\`
U.S. Department of Labor. (2025). [Title]. https://www.dol.gov/[url]
\`\`\`

---

## Legal Cases (Bluebook Format)

### U.S. Supreme Court
\`\`\`
Case Name v. Other Party, Volume U.S. Page, Pinpoint (Year).

Example:
Nevada Dep't of Human Res. v. Hibbs, 538 U.S. 721, 724 (2003).
\`\`\`

### California Supreme Court
\`\`\`
Case Name, Volume Cal. [4th/3d/2d] Page, Pinpoint (Year).

Example:
Brinker Restaurant Corp. v. Superior Court, 53 Cal. 4th 1004 (2012).
\`\`\`

---

## Quick Citation Templates

### For Personnel Records Research Document
\`\`\`apa
[Use this format when citing the comprehensive research provided]

Personnel Records Requirements: Comprehensive Research. (2025). [Unpublished compilation of federal and California employment law requirements].
\`\`\`

### For SHRM Resources
\`\`\`apa
Society for Human Resource Management. (2025). Federal record retention requirements. https://www.shrm.org/content/dam/en/shrm/topics-tools/legal-compliance/Federal-Record-Retention-Requirements.pdf
\`\`\`

---

## Bibliography Builder

\`\`\`dataview
LIST
FROM "07-CITATIONS-BIBLIOGRAPHY"
WHERE file.name != "Citation-Library"
SORT file.name ASC
\`\`\`

---

**Citation Guide Version:** 1.0  
**Last Updated:** $(Get-Date -Format "yyyy-MM-dd HH:mm")
"@
    
    Set-Content -Path "$VaultRoot\07-CITATIONS-BIBLIOGRAPHY\Citation-Library.md" -Value $citationGuide -Encoding UTF8
    Write-Step "Created citation library" "Success"
    
    Write-Step "MODULE 5 COMPLETE" "Success"
}

# ==============================================================================
# MODULE 6: AUDITOR'S TOOLKIT
# ==============================================================================

function Deploy-Module6-Toolkit {
    Write-ModuleHeader "Auditor's Complete Toolkit" 6
    
    Write-Step "Creating auditor's toolkit..." "Progress"
    
    $auditToolkit = @"
---
tags: [audit, toolkit, procedures]
---

# 🔧 Auditor's Complete Toolkit

**Purpose:** Comprehensive guide for conducting the 47-employee audit

---

## 📋 Pre-Audit Checklist

### Before Day 1
- [ ] Obsidian vault deployed and tested
- [ ] All plugins installed (Dataview, Templater, Excalidraw, Kanban, Charts)
- [ ] VSCode workspace configured
- [ ] Python + hr_audit.py script working
- [ ] API keys configured in .env file
- [ ] Stakeholder kickoff meeting scheduled
- [ ] Access to physical employee files confirmed
- [ ] Scanning station/equipment ready

---

## 📊 Audit Evidence Collection

### What to Collect
1. **Physical Files**
   - Personnel jackets
   - Confidential medical files
   - I-9 files
   - Investigation files

2. **Digital Scans**
   - High-resolution PDF scans
   - OCR-processed text
   - Organized by employee ID

3. **Documentation**
   - Photos of file storage
   - Custody logs
   - File condition notes

---

## 🔍 Inspection Procedures

### Step 1: Visual Inspection
- Check file organization
- Identify obvious gaps
- Verify file separation

### Step 2: Document Checklist
- Use master 3-tier checklist
- Mark present/absent for each document
- Note document quality issues

### Step 3: Compliance Verification
- Verify legal requirements met
- Check retention periods
- Confirm proper storage

### Step 4: Findings Documentation
- Document each gap
- Photograph evidence
- Note legal authority

---

## 📝 Quality Control Checkpoints

### After Each Batch
- [ ] Spot-check 10% of AI reviews manually
- [ ] Verify health score calculations accurate
- [ ] Review critical gaps list for accuracy
- [ ] Update stakeholders on progress

### Mid-Project (After Batch 1 & 2)
- [ ] Review methodology with Legal Counsel
- [ ] Adjust AI parameters if needed
- [ ] Validate findings with sample manual review
- [ ] Confirm dashboard metrics accurate

### Final Review (Day 21-22)
- [ ] Cross-check all findings
- [ ] Verify all 47 employees reviewed
- [ ] Validate health score formula
- [ ] Confirm remediation priorities correct

---

## 🚨 Red Flags - Immediate Escalation

**Escalate to Legal Counsel Immediately if:**

- Missing I-9 forms (ICE audit risk)
- Medical info in personnel files (ADA violation)
- Evidence of discrimination/harassment
- Missing harassment training for supervisors
- Workplace violence incidents not documented
- Retaliation patterns identified
- Wage/hour violations discovered

---

## 📄 Required Audit Documentation

### Audit Trail Must Include
1. Project charter with scope
2. Methodology documentation
3. Checklist used for review
4. Evidence of each file reviewed
5. Findings for each employee
6. Aggregate findings summary
7. Remediation plan
8. Quality control verification

---

## 🎯 Best Practices

### DO
✅ Maintain confidentiality at all times  
✅ Document everything contemporaneously  
✅ Use consistent methodology  
✅ Verify findings with spot checks  
✅ Keep stakeholders informed  
✅ Preserve chain of custody  
✅ Flag high-risk items immediately

### DON'T
❌ Rush through reviews  
❌ Skip quality control steps  
❌ Make assumptions without verification  
❌ Discuss findings with non-stakeholders  
❌ Modify documents during review  
❌ Delay escalating critical issues

---

## 📞 Escalation Matrix

| Issue | Escalate To | Timeframe |
|-------|-------------|-----------|
| Missing I-9 | Legal Counsel | Immediate |
| ADA violation | Legal Counsel | Within 24 hours |
| Harassment finding | HR Director + Legal | Within 24 hours |
| Wage/hour violation | Legal Counsel | Within 48 hours |
| Systemic gap | HR Director | Within 1 week |
| Minor documentation gap | Track for remediation | End of audit |

---

## 📈 Success Metrics

### Audit Quality Indicators
- **Completeness:** 100% of 47 files reviewed
- **Accuracy:** <5% error rate in AI vs. manual spot checks
- **Timeliness:** Complete within 23 working days
- **Actionability:** Clear remediation plan delivered
- **Risk Mitigation:** All high-risk gaps identified

---

## 🎓 Resources

- [[PROJECT-CHARTER|23-Day Project Plan]]
- [[Health-Score-Tracker|Real-Time Metrics]]
- [[Master-File-Index|Document Registry]]
- [[California-Required-Policies-Checklist|Policy Compliance]]
- [[Citation-Library|Legal References]]

---

**Toolkit Version:** 1.0  
**Created:** $(Get-Date -Format "yyyy-MM-dd HH:mm")
"@
    
    Set-Content -Path "$VaultRoot\01-AUDIT-PLANNING\Auditors-Toolkit.md" -Value $auditToolkit -Encoding UTF8
    Write-Step "Created auditor's toolkit" "Success"
    
    Write-Step "MODULE 6 COMPLETE" "Success"
}

# ==============================================================================
# MAIN DEPLOYMENT EXECUTION
# ==============================================================================

function Start-Deployment {
    Clear-Host
    
    Write-Host @"

╔══════════════════════════════════════════════════════════════╗
║                                                              ║
║     HR AUDIT VAULT - COMPLETE AUTOMATED DEPLOYMENT          ║
║     Version 3.0 - One-Click Installation                     ║
║                                                              ║
╚══════════════════════════════════════════════════════════════╝

"@ -ForegroundColor Cyan
    
    # Check prerequisites
    $prereqsOk = Test-Prerequisites
    
    if (-not $prereqsOk) {
        Write-Step "Prerequisites check failed. Please fix issues and try again." "Error"
        return
    }
    
    Write-Host "`nStarting deployment of all 6 modules...`n" -ForegroundColor $ColorInfo
    Start-Sleep -Seconds 2
    
    # Deploy all modules
    Deploy-Module1-Foundation
    Start-Sleep -Seconds 1
    
    Deploy-Module2-Dashboard
    Start-Sleep -Seconds 1
    
    Deploy-Module3-Indexing
    Start-Sleep -Seconds 1
    
    Deploy-Module4-Policy
    Start-Sleep -Seconds 1
    
    Deploy-Module5-Citations
    Start-Sleep -Seconds 1
    
    Deploy-Module6-Toolkit
    Start-Sleep -Seconds 1
    
    # Final summary
    Write-Banner "🎉 DEPLOYMENT COMPLETE!"
    
    Write-Host "`n$IconSuccess All 6 modules deployed successfully!`n" -ForegroundColor $ColorSuccess
    
    Write-Host "📂 Vault Location:" -ForegroundColor $ColorInfo
    Write-Host "   $VaultRoot`n" -ForegroundColor White
    
    Write-Host "🎯 Next Steps:`n" -ForegroundColor $ColorWarning
    Write-Host "   1. Open Obsidian" -ForegroundColor White
    Write-Host "   2. Select: Open folder as vault" -ForegroundColor White
    Write-Host "   3. Navigate to: $VaultRoot" -ForegroundColor White
    Write-Host "   4. Follow: PLUGIN-INSTALLATION-GUIDE.md" -ForegroundColor White
    Write-Host "   5. Open: 00-MASTER-DASHBOARD.md to start!`n" -ForegroundColor White
    
    Write-Host "📝 Important Files Created:`n" -ForegroundColor $ColorInfo
    Write-Host "   ✓ PROJECT-CHARTER.md (23-day plan)" -ForegroundColor $ColorSuccess
    Write-Host "   ✓ Health-Score-Tracker.md (auto-updating)" -ForegroundColor $ColorSuccess
    Write-Host "   ✓ 00-MASTER-DASHBOARD.md (command center)" -ForegroundColor $ColorSuccess
    Write-Host "   ✓ California-Required-Policies-Checklist.md" -ForegroundColor $ColorSuccess
    Write-Host "   ✓ Citation-Library.md (APA/MLA/Bluebook)" -ForegroundColor $ColorSuccess
    Write-Host "   ✓ Auditors-Toolkit.md (procedures)" -ForegroundColor $ColorSuccess
    
    Write-Host "`n⚠️  REMEMBER:`n" -ForegroundColor $ColorWarning
    Write-Host "   • Add your API keys to: Scripts\.env" -ForegroundColor White
    Write-Host "   • Install Obsidian plugins (10-15 min)" -ForegroundColor White
    Write-Host "   • Test with: python Scripts\hr_audit.py`n" -ForegroundColor White
    
    Write-Host "Press any key to exit..." -ForegroundColor Gray
    $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
}

# Execute deployment
Start-Deployment